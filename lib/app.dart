import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/injection.dart';
import 'features/core/application/cubit/intro_cubit.dart';
import 'features/core/presentation/routes.dart';
import 'features/core/presentation/splash_screen.dart';
import 'features/generator/presentation/generator_screen.dart';
import 'features/intro/presentation/intro_screen.dart';

class FiremelonApp extends StatelessWidget {
  const FiremelonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<IntroCubit>() //
        ..checkIfSeenIntro(),
      child: MaterialApp(
        initialRoute: Routes.splash,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Routes.splash:
              return SplashScreen.route();
            case Routes.intro:
              return IntroScreen.route();
            case Routes.generator:
              return GeneratorScreen.route();
          }
          return null;
        },
        theme: ThemeData.from(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFF6969),
          ),
        ),
      ),
    );
  }
}
