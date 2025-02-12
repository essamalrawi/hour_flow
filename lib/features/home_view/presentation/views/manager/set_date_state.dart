part of 'set_data_cubit.dart';

@immutable
sealed class TimeState {}

final class SetDataInitial extends TimeState {}
final class SetDataSuccess extends TimeState {}
final class SetDataLoading extends TimeState {}
final class SetDataFailure extends TimeState {
  final String message;

  SetDataFailure(this.message);
}
