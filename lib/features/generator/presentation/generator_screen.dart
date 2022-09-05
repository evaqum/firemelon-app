import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/provide.dart';
import '../../core/presentation/routes.dart';
import '../../core/presentation/transitions.dart';
import '../application/cubit/generator_screen_cubit.dart';

class GeneratorScreen extends StatelessWidget {
  const GeneratorScreen({super.key});

  static Route route() {
    return FadeTransitionRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          provide((GeneratorScreenCubit cubit) {
            cubit.generatePassword();
          }),
        ],
        child: const GeneratorScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GeneratorScreenCubit>();

    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<GeneratorScreenCubit, GeneratorScreenState>(
            listenWhen: (previous, current) {
              return previous.lastCopied != current.lastCopied && current.lastCopied != null;
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(const SnackBar(
                  content: Text('password is copied to the clipboard'),
                ));
            },
          ),
          BlocListener<GeneratorScreenCubit, GeneratorScreenState>(
            listenWhen: (previous, current) {
              return previous.showSaveDialog != current.showSaveDialog && current.showSaveDialog;
            },
            listener: (context, state) async {
              await showDialog(
                context: context,
                builder: (context) {
                  return BlocBuilder<GeneratorScreenCubit, GeneratorScreenState>(
                    bloc: cubit,
                    builder: (context, state) {
                      return AlertDialog(
                        title: const Text('save password'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('cancel'),
                          ),
                          TextButton(
                            onPressed: cubit.state.passwordTitle.isNotEmpty
                                ? () {
                                    cubit.savePassword();
                                    Navigator.pop(context);
                                  }
                                : null,
                            child: const Text('save'),
                          ),
                        ],
                        content: TextFormField(
                          onChanged: cubit.passwordTitleChanged,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'password title',
                          ),
                        ),
                      );
                    },
                  );
                },
              );
              cubit.closeSaveDialog();
            },
          ),
        ],
        child: BlocBuilder<GeneratorScreenCubit, GeneratorScreenState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: [
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pushNamed(context, Routes.passManager),
                        icon: const Icon(Icons.vpn_key, color: Colors.black54),
                      ),
                    ],
                  ),
                  const _CurrentWidget(),
                  Row(children: [
                    Text('complexity', style: GoogleFonts.montserrat()),
                    const SizedBox(width: 8.0),
                    Text(
                      '${state.complexity}',
                      style: GoogleFonts.montserrat(color: Colors.black54),
                    ),
                  ]),
                  Slider(
                    value: state.complexity.toDouble(),
                    onChanged: (v) => cubit.complexityChanged(v.toInt()),
                    divisions: 10 - 2,
                    min: 2,
                    max: 10,
                  ),
                  Row(children: [
                    Text('add number?', style: GoogleFonts.montserrat()),
                    const Expanded(child: SizedBox()),
                    Switch(
                      value: state.addNumber,
                      onChanged: cubit.addNumberChanged,
                    ),
                  ]),
                ],
              ),
            );
          },
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
      (GeneratorScreenCubit cubit) => cubit.state.currentPassword?.length ?? 0,
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
                const _CopyButton(_ButtonPosition.left),
                Text(
                  'length: $passwordLength',
                  style: GoogleFonts.montserrat(),
                ),
                const _SaveButton(_ButtonPosition.right),
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
    final currentPassword = context.select((GeneratorScreenCubit cubit) => cubit.state.currentPassword);

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

enum _ButtonPosition { left, right }

class _Button extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  final _ButtonPosition position;
  const _Button({
    required this.text,
    required this.icon,
    required this.position,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final children = [
      Icon(icon, color: Colors.black45),
      const SizedBox(width: 6.0),
      AnimatedSwitcher(
        layoutBuilder: (currentChild, previousChildren) {
          return Stack(
            alignment: position == _ButtonPosition.left //
                ? Alignment.centerLeft
                : Alignment.centerRight,
            children: [
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          );
        },
        duration: const Duration(milliseconds: 300),
        child: Text(
          text,
          key: ValueKey(text),
          style: GoogleFonts.montserrat(color: Colors.black45, fontWeight: FontWeight.w500),
        ),
      ),
    ];
    return Expanded(
      child: Row(
        mainAxisAlignment: position == _ButtonPosition.left //
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(200.0),
            child: Material(
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: position == _ButtonPosition.right //
                        ? children.reversed.toList()
                        : children,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CopyButton extends StatelessWidget {
  final _ButtonPosition position;
  const _CopyButton(this.position);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GeneratorScreenCubit>();

    return _Button(
      text: 'copy',
      icon: Icons.copy_rounded,
      onTap: cubit.copyPassword,
      position: position,
    );
  }
}

class _SaveButton extends StatelessWidget {
  final _ButtonPosition position;
  const _SaveButton(this.position);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<GeneratorScreenCubit>();

    return _Button(
      text: cubit.state.isSaved ? 'saved!' : 'save',
      icon: Icons.save_alt,
      onTap: cubit.state.isSaved ? null : cubit.showSaveDialog,
      position: position,
    );
  }
}
