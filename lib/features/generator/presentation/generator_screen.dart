import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../di/injection.dart';
import '../../core/presentation/transitions.dart';
import '../application/cubit/generator_cubit.dart';

class GeneratorScreen extends StatelessWidget {
  const GeneratorScreen({super.key});

  static Route route() {
    return FadeTransitionRoute(
      builder: (_) => BlocProvider(
        create: (context) => getIt<GeneratorCubit>() //
          ..generatePassword(),
        child: const GeneratorScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<GeneratorCubit>();

    return Scaffold(
      body: BlocListener<GeneratorCubit, GeneratorState>(
        listenWhen: (previous, current) => previous.lastCopied != current.lastCopied && current.lastCopied != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(const SnackBar(
              content: Text('password is copied to clipboard'),
              behavior: SnackBarBehavior.floating,
            ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              const _CurrentWidget(),
              Row(children: [
                Text('complexity', style: GoogleFonts.montserrat()),
                const SizedBox(width: 8.0),
                Text(
                  '${cubit.state.complexity}',
                  style: GoogleFonts.montserrat(color: Colors.black54),
                ),
              ]),
              Slider(
                value: cubit.state.complexity.toDouble(),
                onChanged: (v) => cubit.complexityChanged(v.toInt()),
                divisions: 10 - 2,
                min: 2,
                max: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CurrentWidget extends StatelessWidget {
  const _CurrentWidget();

  @override
  Widget build(BuildContext context) {
    final passwordLength = context.select(
      (GeneratorCubit cubit) => cubit.state.currentPassword?.length ?? 0,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'your new password is...',
              style: GoogleFonts.montserrat(color: Colors.black54),
            ),
            const _CurrentPasswordWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _CopyButton(),
                Text(
                  'length: $passwordLength',
                  style: GoogleFonts.montserrat(),
                ),
                const _SaveButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrentPasswordWidget extends StatelessWidget {
  const _CurrentPasswordWidget();

  @override
  Widget build(BuildContext context) {
    final currentPassword = context.select((GeneratorCubit cubit) => cubit.state.currentPassword);

    return SizedBox(
      height: 50.0,
      child: Center(
        child: AutoSizeText(
          currentPassword ?? 'not yet generated',
          key: ValueKey(currentPassword ?? '_'),
          maxLines: 1,
          softWrap: false,
          textAlign: TextAlign.center,
          maxFontSize: 32.0,
          minFontSize: 16.0,
          overflow: TextOverflow.fade,
          style: GoogleFonts.montserrat(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            // fontSize: 32.0,
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  final bool reverse;
  const _Button({
    required this.text,
    required this.icon,
    this.reverse = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final children = [
      Icon(icon, color: Colors.black45),
      const SizedBox(width: 6.0),
      Text(
        text,
        style: GoogleFonts.montserrat(color: Colors.black45, fontWeight: FontWeight.w500),
      ),
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(200.0),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: reverse ? children.reversed.toList() : children,
            ),
          ),
        ),
      ),
    );
  }
}

class _CopyButton extends StatelessWidget {
  const _CopyButton();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<GeneratorCubit>();

    return _Button(
      text: 'copy',
      icon: Icons.copy_rounded,
      onTap: cubit.copyPassword,
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return _Button(
      text: 'save',
      icon: Icons.save_alt,
      onTap: () {},
      reverse: true,
    );
  }
}
