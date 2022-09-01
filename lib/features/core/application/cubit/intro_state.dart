part of 'intro_cubit.dart';

@freezed
class IntroState with _$IntroState {
  const factory IntroState.initial() = _Initial;
  const factory IntroState.notSeenIntro() = _NotSeenIntro;
  const factory IntroState.seenIntro() = _SeenIntro;
}
