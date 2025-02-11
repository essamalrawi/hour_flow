import 'package:flutter/material.dart';
import 'package:hour_flow/features/home_view/presentation/views/home_view.dart';

import '../../../../../core/utils/app_images.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    excuteNaviagtion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ClipRRect(
              child: SizedBox(
            width: 250,
            height: 250,
            child: Image.asset(Assets.imagesLogo),
          )),
        )
      ],
    );
  }

  void excuteNaviagtion() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
  }
}
