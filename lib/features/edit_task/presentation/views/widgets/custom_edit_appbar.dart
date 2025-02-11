import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';

class CustomEditAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomEditAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: AppBar(
          leading: IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              Assets.imagesBack,
              height: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            Text(
              'Done',
              style: TextStyle(
                color: Color(0xFFF1F0FB),
                fontSize: 18.09,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
