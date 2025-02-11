import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hour_flow/features/home_view/presentation/views/widgets/home_view_body.dart';

import '../../../../core/utils/app_images.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Activity',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.imagesChart,
                  width: 24,
                  height: 24,
                ),
              )),
        ],
      ),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
