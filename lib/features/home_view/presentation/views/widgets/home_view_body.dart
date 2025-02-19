import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hour_flow/consnats.dart';
import 'package:hour_flow/core/services/shared_preferences_singleton.dart';
import 'package:hour_flow/features/home_view/presentation/views/widgets/custom_button.dart';
import 'package:hour_flow/features/home_view/presentation/views/widgets/showBorrowedMoneySheet.dart';
import 'package:hour_flow/features/home_view/presentation/views/widgets/total_hours.dart';
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
              onPressed: () {
                // BlocProvider.of<SetDataCubit>(context)
                //     .setTime(context: context);
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
            Prefs.getMinutes(kTotalHours) == 0
                ? SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 13.44),
                      TotalHoursWidget(
                        totalMinutes: Prefs.getMinutes(kTotalHours),
                      ),
                    ],
                  ),
            SizedBox(height: 13.44),
            BorrowedMoneyWidget(
              amount: Prefs.getDouble(kBorrowedMoney),
            ),
            SizedBox(height: 13.44),
          ],
        ),
      ),
    );
  }
}
