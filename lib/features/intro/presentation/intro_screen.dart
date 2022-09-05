import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/application/cubit/intro_cubit.dart';
import '../../core/presentation/routes.dart';
import '../../core/presentation/transitions.dart';
import 'widgets/melon_logo.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  static Route route() {
    return FadeTransitionRoute(
      builder: (_) => const IntroScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<IntroCubit>();

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          const MelonLogo(),
          const SizedBox(height: 16.0),
          Text(
            'firemelon',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
            ),
          ),
          Text(
            'simple password generator',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
          const Expanded(child: SizedBox()),
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                child: ElevatedButton(
                  onPressed: () {
                    cubit.startPressed();
                    Navigator.pushNamedAndRemoveUntil(context, Routes.generator, (route) => false);
                  },
                  child: Text(
                    'start',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
