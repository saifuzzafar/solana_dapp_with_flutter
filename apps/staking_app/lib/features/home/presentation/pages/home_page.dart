import 'package:auto_route/auto_route.dart';
import 'package:core_flutter/core/base_ui/base_page.dart';
import 'package:core_flutter/core/base_ui/device_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staking_app/features/home/di/home_providers.dart';
import 'package:staking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:staking_app/features/home/presentation/cubit/home_state.dart';
import 'package:staking_app/features/home/presentation/pages/home_page_mobile_view.dart';
import 'package:staking_app/features/home/presentation/pages/home_page_tab_view.dart';
import 'package:staking_app/features/home/presentation/pages/home_page_web_view.dart';

/// This class [HomePage] which is UI screen which display interact with the user
@RoutePage()
class HomePage extends BasePage<HomePageState> {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

/// This class [HomePageState] which consume by HomePage as page state
class HomePageState extends BaseStatefulPage {
  late HomeProviders homeProviders;

  @override
  void initState() {
    super.initState();
    homeProviders = HomeProviders.instance();
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBar();
  }

  @override
  Widget buildView(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return HomeCubit(homeProviders.homeUseCase);
          },
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeCubitState>(
        builder: (context, state) {
          if (state is HomeLoadedState) {
            return DeviceDetectorWidget(
              webSiteView: () => const HomePageWebView(),
              phoneView: () => HomePageMobileView(
                pdaAccount: state.pdaAccount,
                lamPorts: state.lamPorts,
              ),
              tabletView: () => const HomePageTabView(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
