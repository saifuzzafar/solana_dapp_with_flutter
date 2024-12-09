import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:staking_app/main/navigation/route_path.dart';
import 'package:staking_app/main/navigation/staking_app_router.gr.dart';

@AutoRouterConfig()
class StakingAppRouter extends $StakingAppRouter {
  final GlobalKey<NavigatorState> navigationKey;

  StakingAppRouter(this.navigationKey) : super();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: RoutePaths.home, page: HomeRoute.page, initial: true),
      ];
}
