import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/preferences_repository.dart';

part 'intro_cubit.freezed.dart';
part 'intro_state.dart';

@injectable
class IntroCubit extends Cubit<IntroState> {
  final PreferencesRepository preferencesRepository;
  IntroCubit(this.preferencesRepository) : super(const IntroState.initial());

  Future<void> startPressed() async {
    await preferencesRepository.setSeenIntro(true);
    emit(const IntroState.seenIntro());
  }

  Future<void> checkIfSeenIntro() async {
    final seenIntro = await preferencesRepository.getSeenIntro();

    if (seenIntro) {
      return emit(const IntroState.seenIntro());
    }
    return emit(const IntroState.notSeenIntro());
  }
}
