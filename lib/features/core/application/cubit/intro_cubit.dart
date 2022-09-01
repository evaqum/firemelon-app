import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../intro/data/intro_repository.dart';

part 'intro_cubit.freezed.dart';
part 'intro_state.dart';

@injectable
class IntroCubit extends Cubit<IntroState> {
  final IntroRepository introRepository;
  IntroCubit(this.introRepository) : super(const IntroState.initial());

  Future<void> checkIfSeenIntro() async {
    final seenIntro = await introRepository.getSeenIntro();
    log('4zx $seenIntro');

    if (seenIntro) {
      return emit(const IntroState.seenIntro());
    }
    return emit(const IntroState.notSeenIntro());
  }
}
