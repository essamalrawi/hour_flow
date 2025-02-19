part of 'get_employee_data_cubit.dart';

@immutable
sealed class GetEmployeeDataState {}

final class GetEmployeeDataInitial extends GetEmployeeDataState {}

final class GetEmployeeDataLoading extends GetEmployeeDataState {}

final class GetEmployeeDataFaluire extends GetEmployeeDataState {
  final String errorMessage;

  GetEmployeeDataFaluire({required this.errorMessage});
}

final class GetEmployeeDataSucces extends GetEmployeeDataState {}
