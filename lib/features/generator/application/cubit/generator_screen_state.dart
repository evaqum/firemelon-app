part of 'generator_screen_cubit.dart';

@freezed
class GeneratorScreenState with _$GeneratorScreenState {
  const factory GeneratorScreenState({
    required String? currentPassword,
    required int complexity,
    required bool addNumber,
    required String? lastCopied,
    required bool isSaved,
    required bool showSaveDialog,
    required String passwordTitle,
    // TODO: separators,
  }) = _GeneratorScreenState;

  factory GeneratorScreenState.initial() {
    return const GeneratorScreenState(
      currentPassword: null,
      lastCopied: null,
      complexity: 4,
      addNumber: true,
      isSaved: false,
      showSaveDialog: false,
      passwordTitle: '',
    );
  }
}
