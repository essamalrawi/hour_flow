import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../../../../core/utils/app_images.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final List<DateTime>? dateTime =
                        await showOmniDateTimeRangePicker(context: context);

                    // Use dateTime here
                    debugPrint('dateTime: $dateTime');
                  },
                  child: const Text('Show DateTime Picker'),
                ),
              ],
            ),
            // IconButton(
            //     padding: EdgeInsets.zero,
            //     onPressed: () {},
            //     icon: SvgPicture.asset(Assets.imagesDeleteIcon)),
          ],
        ),
      ),
    );
  }
}
