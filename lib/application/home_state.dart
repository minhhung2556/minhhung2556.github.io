part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeDoneLoadingState extends HomeState {
  final Profile data;

  HomeDoneLoadingState({required this.data});
}
