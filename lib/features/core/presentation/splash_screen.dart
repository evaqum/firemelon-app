import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/cubit/intro_cubit.dart';
import 'routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static Route route() => MaterialPageRoute(builder: (_) => const SplashScreen());

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroCubit, IntroState>(
      listener: (context, state) {
        log('$state');
        state.when<void>(
          initial: () {},
          notSeenIntro: () {
            Navigator.pushNamedAndRemoveUntil(context, Routes.intro, (route) => false);
          },
          seenIntro: () {
            Navigator.pushNamedAndRemoveUntil(context, Routes.generator, (route) => false);
          },
        );
      },
      child: const Scaffold(),
    );
  }
}
