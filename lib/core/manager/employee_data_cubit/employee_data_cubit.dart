import 'package:bloc/bloc.dart';
import 'package:hour_flow/core/services/firestore_service.dart';
import 'package:meta/meta.dart';

import '../../models/employee_model.dart';

part 'employee_data_state.dart';

class EmployeeDataCubit extends Cubit<EmployeeDataState> {
  EmployeeDataCubit(this.firebase) : super(EmployeeDataInitial());
  final FireStoreService firebase;
  void addEmployee({required EmployeeModel employee}) {
    emit(EmployeeDataLoading());

    try {
      firebase.addEmployee(employee: employee);
      emit(EmployeeDataSucces());
    } catch (e) {
      emit(EmployeeDataFaluire(errorMessage: e.toString()));
    }
  }
}
