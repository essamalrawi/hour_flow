import 'package:bloc/bloc.dart';
import 'package:hour_flow/core/services/firestore_service.dart';
import 'package:meta/meta.dart';

import '../../entites/employee_entity.dart';

part 'employee_data_state.dart';

class EmployeeDataCubit extends Cubit<EmployeeDataState> {
  EmployeeDataCubit(this.firebase) : super(EmployeeDataInitial());
  final FireStoreService firebase;
  List<EmployeeEntity> employees = [];
  List<String> records = [];
  EmployeeEntity selectedEmployee = EmployeeEntity.empty();

  void addEmployee({required EmployeeEntity employee}) {
    emit(EmployeeDataLoading());
    try {
      firebase.addEmployee(employee: employee);
      selectedEmployee = employee;
      emit(EmployeeDataSucces());
    } catch (e) {
      emit(EmployeeDataFaluire(errorMessage: e.toString()));
    }
  }

  void updateHours(
      {required String signIn,
      required String signOut,
      required int total}) async {
    emit(EmployeeDataLoading());
    try {
      await firebase.updateTime(
          employee: selectedEmployee,
          signIn: signIn,
          signOut: signOut,
          total: total);
      selectedEmployee.totalMins += total;
      emit(EmployeeDataSucces());
    } catch (e) {
      emit(EmployeeDataFaluire(errorMessage: e.toString()));
    }
  }

  void borrowedMoney({required double money}) async {
    emit(EmployeeDataLoading());
    try {
      await firebase.borrowedMoney(employee: selectedEmployee, amount: money);
      selectedEmployee.borrowedMoney += money;
      emit(EmployeeDataSucces());
    } catch (e) {
      emit(EmployeeDataFaluire(errorMessage: e.toString()));
    }
  }

  void getAllEmployees() async {
    emit(EmployeeDataLoading());

    try {
      employees = await firebase.getAllEmployees();
      selectedEmployee = employees.last;
      emit(EmployeeDataSucces());
    } catch (e) {
      emit(EmployeeDataFaluire(errorMessage: e.toString()));
    }
  }

  void setSelectedEmployee({required EmployeeEntity selecEmp}) {
    selectedEmployee = selecEmp;
    emit(EmployeeDataSucces());
  }
}
