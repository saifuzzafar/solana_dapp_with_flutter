import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana/dto.dart';
import 'package:solana/solana.dart';
import 'package:staking_app/features/home/domain/use_case/home_use_case.dart';
import 'package:staking_app/features/home/presentation/cubit/home_state.dart';

/// This class [HomeCubit] is consume by the [HomePage]
/// where all state will observed by [HomePage]
class HomeCubit extends Cubit<HomeCubitState> {
  final HomeUseCase _homeUseCase;

  HomeCubit(HomeUseCase homeUseCase)
      : _homeUseCase = homeUseCase,
        super(HomeInitialState()) {
    Future.microtask(() => fetchProgramAccounts());
  }

  Future<void> fetchProgramAccounts() async {
    final client = SolanaClient(
      rpcUrl: Uri.parse('https://api.devnet.solana.com'),
      websocketUrl: Uri.parse('wss://api.devnet.solana.com'),
    );

    final programId = Ed25519HDPublicKey.fromBase58(
        '6NDmbJngEsAQkywt376w5gCNuUshvEmKr7APEi5i28wU');

    try {
      final programAccounts = await client.rpcClient.getProgramAccounts(
          programId.toBase58(),
          encoding: Encoding.jsonParsed);

      List<String> pdaAccount = [];
      List<String> lamPorts = [];
      for (var account in programAccounts) {
        pdaAccount.add(account.pubkey);
        lamPorts.add(account.account.lamports.toString());
      }
      emit(HomeLoadedState(
          lamPorts: lamPorts.toString(), pdaAccount: pdaAccount.toString()));
    } catch (e) {
      print("Error fetching program accounts: $e");
    }
  }
}
