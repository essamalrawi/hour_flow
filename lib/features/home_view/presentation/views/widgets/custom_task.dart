import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';

class CustomTask extends StatelessWidget {
  const CustomTask({super.key, this.lastTask = false});
  final bool? lastTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 91.84,
      padding: const EdgeInsets.all(13.44),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: lastTask == false ? Color(0xFF1B232E) : null,
        gradient: lastTask == true
            ? LinearGradient(
                begin: Alignment(1.00, 0.00),
                end: Alignment(-1, 0),
                colors: [Color(0xFF00D2E3), Color(0xFF670EFD)],
              )
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.96),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Gym',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.imagesHierarchy,
                    height: 18,
                  ),
                  SizedBox(
                    width: 8.86,
                  ),
                  Text(
                    "Personal",
                    style: TextStyle(fontSize: 13.44),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 6.72,
          ),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.imagesCalendar,
                    height: 18,
                  ),
                  SizedBox(
                    width: 8.86,
                  ),
                  Text(
                    '2022/02/03 - 01:30',
                    style: TextStyle(
                      fontSize: 13.44,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.imagesCalendar,
                    height: 18,
                  ),
                  SizedBox(
                    width: 8.86,
                  ),
                  Text(
                    '2022/02/03 - 01:30',
                    style: TextStyle(
                      fontSize: 13.44,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
