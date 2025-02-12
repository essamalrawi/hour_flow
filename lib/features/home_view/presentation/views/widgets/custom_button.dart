import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../../../../core/utils/app_images.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 54,
      decoration: BoxDecoration(
        color: Color(0xff1B232E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            // final DateTime? dateTime =
            //     await showOmniDateTimePicker(context: context);

            // Use dateTime here
            // debugPrint('dateTime: $dateTime');

            final List<DateTime>? dateTime =
                await showOmniDateTimeRangePicker(context: context);

            // Use dateTime here
            debugPrint('dateTime: $dateTime');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'إضافة سجل اليوم/مخصص',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.44),
                child: SvgPicture.asset(Assets.imagesAdd),
              ),
            ],
          )),
    );
  }
}
