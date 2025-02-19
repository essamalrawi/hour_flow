part of 'employee_data_cubit.dart';

@immutable
sealed class EmployeeDataState {}

final class EmployeeDataInitial extends EmployeeDataState {}

final class EmployeeDataLoading extends EmployeeDataState {}

final class EmployeeDataFaluire extends EmployeeDataState {
  final String errorMessage;

  EmployeeDataFaluire({required this.errorMessage});
}

final class EmployeeDataSucces extends EmployeeDataState {}
