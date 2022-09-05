part of 'password_manager_cubit.dart';

@freezed
class PasswordManagerState with _$PasswordManagerState {
  const factory PasswordManagerState({
    required List<SavedPassword> savedPasswords,
    required SavedPassword? lastDeletedPassword,
  }) = _PasswordManagerState;

  factory PasswordManagerState.initial() {
    return const PasswordManagerState(
      savedPasswords: [],
      lastDeletedPassword: null,
    );
  }
}
