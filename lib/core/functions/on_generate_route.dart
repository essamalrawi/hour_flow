import 'package:flutter/material.dart';
import 'package:hour_flow/features/edit_task/presentation/views/edit_view.dart';
import '../../features/home_view/presentation/views/home_view.dart';
import '../../features/splash_view/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
