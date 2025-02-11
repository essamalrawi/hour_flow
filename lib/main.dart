import 'package:flutter/material.dart';
import 'package:hour_flow/core/utils/app_colors.dart';
import 'core/functions/on_generate_route.dart';
import 'features/splash_view/presentation/views/splash_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
