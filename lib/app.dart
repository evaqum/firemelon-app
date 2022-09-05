import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/core/application/cubit/intro_cubit.dart';
import 'features/core/presentation/routes.dart';
import 'features/core/presentation/splash_screen.dart';
import 'features/generator/presentation/generator_screen.dart';
import 'features/intro/presentation/intro_screen.dart';
import 'features/password_manager/presentation/password_manager_screen.dart';
import 'utils/provide.dart';

class FiremelonApp extends StatelessWidget {
  const FiremelonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        provide((IntroCubit cubit) {
          cubit.checkIfSeenIntro();
        }),
      ],
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
            case Routes.passManager:
              return PasswordManagerScreen.route();
          }
          return null;
        },
        theme: ThemeData.from(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFF6969),
          ),
        ).copyWith(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle: GoogleFonts.montserrat(fontSize: 18.0, color: Colors.black),
          ),
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: Colors.white,
            contentTextStyle: TextStyle(
              color: Colors.black,
            ),
            actionTextColor: Colors.red,
            elevation: 6.0,
          ),
        ),
      ),
    );
  }
}
