import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_employee_data_state.dart';

class GetEmployeeDataCubit extends Cubit<GetEmployeeDataState> {
  GetEmployeeDataCubit() : super(GetEmployeeDataInitial());
}
