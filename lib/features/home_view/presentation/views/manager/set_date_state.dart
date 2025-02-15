part of 'set_data_cubit.dart';

@immutable
sealed class SetDataState {}

final class SetDataInitial extends SetDataState {}

final class SetDataSuccess extends SetDataState {}

final class SetDataLoading extends SetDataState {}

final class SetDataFailure extends SetDataState {
  final String message;

  SetDataFailure(this.message);
}
