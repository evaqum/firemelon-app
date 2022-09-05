import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/password_manager_repository.dart';
import '../../domain/password.dart';

part 'password_manager_cubit.freezed.dart';
part 'password_manager_state.dart';

@injectable
class PasswordManagerCubit extends Cubit<PasswordManagerState> {
  final PasswordManagerRepository repository;
  StreamSubscription? _passwordsSubscription;

  PasswordManagerCubit(this.repository) : super(PasswordManagerState.initial());

  void subscribeToSavedPasswordsBox() {
    _passwordsSubscription = repository.savedPasswordsStream().listen((event) {
      emit(state.copyWith(savedPasswords: event));
    });
  }

  Future<void> copyPassword(SavedPassword password) {
    return Clipboard.setData(ClipboardData(text: password.password));
  }

  Future<void> savePassword({
    required String password,
    required String title,
  }) async {
    final pass = SavedPassword(password: password, title: title);
    await repository.savePassword(password, title);

    emit(state.copyWith(savedPasswords: [
      ...state.savedPasswords,
      pass,
    ]));
  }

  Future<void> deletePassword(SavedPassword password) async {
    await repository.deleteSavedPassword(password);
    emit(state.copyWith(lastDeletedPassword: password));
  }

  Future<void> restoreLastDeletedPassword() async {
    if (state.lastDeletedPassword == null) {
      return;
    }
    await repository.savePassword(
      state.lastDeletedPassword!.password,
      state.lastDeletedPassword!.title,
    );
  }

  @override
  Future<void> close() async {
    await _passwordsSubscription?.cancel();
    return super.close();
  }
}
