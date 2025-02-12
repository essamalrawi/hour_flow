import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../../../../consnats.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';

part 'set_date_state.dart';

class SetDataCubit extends Cubit<TimeState> {
  SetDataCubit() : super(SetDataInitial());

  setTime({required context}) async {
    final List<DateTime>? dateTime =
        await showOmniDateTimeRangePicker(context: context);
    // Use dateTime here
    if (dateTime != null) {
      DateTime startTime = dateTime[0];
      DateTime endTime = dateTime[1];

      if (endTime.difference(startTime).inMinutes <= 0) {
        emit(SetDataFailure("مينفعش تحط ارقام بالسالب"));
      } else {
        emit(SetDataLoading());
        Prefs.setMinutes(
            kTotalHours,
            Prefs.getMinutes(kTotalHours) +
                endTime.difference(startTime).inMinutes);
        emit(SetDataSuccess());
      }

      delayedFunction();
    }
  }

  setMoney({required money}) {
    // Use dateTime here
    emit(SetDataInitial());
    if (money != null) {
      double total = Prefs.getDouble(kBorrowedMoney);

      Prefs.setDouble(kBorrowedMoney, money + total);
      emit(SetDataSuccess());
      delayedFunction();
    }
    emit(SetDataFailure(""));
  }

  void delayedFunction() {
    Future.delayed(Duration(seconds: 4), () {
      emit(SetDataInitial());
    });
  }
}
