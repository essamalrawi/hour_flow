import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hour_flow/core/manager/employee_data_cubit/employee_data_cubit.dart';
import 'package:hour_flow/features/home_view/presentation/views/widgets/custom_button.dart';
import 'package:hour_flow/features/home_view/presentation/views/widgets/showBorrowedMoneySheet.dart';
import 'package:hour_flow/features/home_view/presentation/views/widgets/total_hours.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import '../../../../../core/utils/app_images.dart';
import 'borroed_money_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 26),
            SizedBox(height: 10),
            SizedBox(height: 13.44),
            CustomButton(
              title: "تسجيل يوم",
              icon: SvgPicture.asset(Assets.imagesAdd),
              onPressed: () async {
                final List<DateTime>? dateTime =
                    await showOmniDateTimeRangePicker(context: context);
                if (dateTime != null) {
                  String signIn =
                      DateFormat('yyyy-MM-dd hh:mm a').format(dateTime[0]);
                  String signOut =
                      DateFormat('yyyy-MM-dd hh:mm a').format(dateTime[1]);
                  int minutesDifference =
                      dateTime[1].difference(dateTime[0]).inMinutes;

                  if (minutesDifference > 0) {
                    context.read<EmployeeDataCubit>().updateHours(
                        signIn: signIn,
                        signOut: signOut,
                        total: minutesDifference);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("مينفعش تحط ايام بالسوالب")));

                    // .... exception
                  }

                  print('before: $signIn after: $signOut');
                }
              },
            ),
            SizedBox(height: 13.44),
            CustomButton(
              title: "   اقتراض المال",
              icon: Icon(
                FontAwesomeIcons.wallet,
                color: Colors.white,
              ),
              onPressed: () {
                showBorrowMoneySheet(context);
              },
            ),
            BlocBuilder<EmployeeDataCubit, EmployeeDataState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 13.44),
                    TotalHoursWidget(
                      totalMinutes: context
                          .read<EmployeeDataCubit>()
                          .selectedEmployee
                          .totalMins,
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 13.44),
            BlocBuilder<EmployeeDataCubit, EmployeeDataState>(
              builder: (context, state) {
                return BorrowedMoneyWidget(
                  amount: context
                      .read<EmployeeDataCubit>()
                      .selectedEmployee
                      .borrowedMoney,
                );
              },
            ),
            SizedBox(height: 28),
            // gonna work on it later ..
            // LatestUpdates(
            //   records: [
            //     "اقترض أحمد 500 دولار",
            //     "سجل خالد حضوره الساعة 9:00 صباحًا",
            //     "غادر سالم الساعة 5:00 مساءً",
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
