import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hour_flow/core/services/get_it_service.dart';
import 'package:hour_flow/core/utils/app_colors.dart';
import 'package:hour_flow/features/home_view/presentation/views/manager/set_data_cubit.dart';
import 'core/functions/on_generate_route.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'features/splash_view/presentation/views/splash_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetDataCubit(),
      child: MaterialApp(
        initialRoute: SplashView.routeName,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        locale: const Locale('ar'),
        theme: ThemeData(
          fontFamily: 'Cairo',
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
