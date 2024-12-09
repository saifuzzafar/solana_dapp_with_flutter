import 'package:equatable/equatable.dart';

/// This class [HomeCubitState] which should be consume by Cubit as it's state
abstract class HomeCubitState extends Equatable {
  @override
  List<Object?> get props => [];

  const HomeCubitState();
}

class HomeInitialState extends HomeCubitState {}

class HomeLoadedState extends HomeCubitState {
  final String lamPorts;
  final String pdaAccount;

  const HomeLoadedState({required this.lamPorts, required this.pdaAccount});
}
