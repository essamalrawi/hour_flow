import 'package:flutter/material.dart';
import 'package:hour_flow/core/utils/app_colors.dart';
import 'core/functions/on_generate_route.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'features/splash_view/presentation/views/splash_view.dart';

void main() async {  WidgetsFlutterBinding.ensureInitialized();
await Prefs.init();
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
      locale: const Locale('ar'),
      theme: ThemeData(
        fontFamily: 'Cairo',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
