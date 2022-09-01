part of 'generator_cubit.dart';

@freezed
class GeneratorState with _$GeneratorState {
  const factory GeneratorState({
    required String? currentPassword,
    required String? lastCopied,
    required int complexity,
    required bool addNumber,
    // TODO: separators,
  }) = _GeneratorState;

  factory GeneratorState.initial() {
    return const GeneratorState(
      currentPassword: null,
      lastCopied: null,
      complexity: 4,
      addNumber: true,
    );
  }
}
