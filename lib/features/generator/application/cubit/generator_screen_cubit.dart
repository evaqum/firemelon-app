import 'package:firemelon/firemelon.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../password_manager/data/password_manager_repository.dart';

part 'generator_screen_cubit.freezed.dart';
part 'generator_screen_state.dart';

@injectable
class GeneratorScreenCubit extends Cubit<GeneratorScreenState> {
  final Firemelon firemelon;
  final PasswordManagerRepository passwordManagerRepository;
  GeneratorScreenCubit({
    required this.firemelon,
    required this.passwordManagerRepository,
  }) : super(GeneratorScreenState.initial());

  void complexityChanged(int next) {
    emit(state.copyWith(complexity: next));
    generatePassword();
  }

  void addNumberChanged(bool next) {
    emit(state.copyWith(addNumber: next));
    generatePassword();
  }

  void generatePassword() {
    emit(state.copyWith(
      isSaved: false,
      currentPassword: firemelon.generate(
        complexity: state.complexity,
        useNumber: state.addNumber,
      ),
    ));
  }

  void copyPassword() {
    emit(state.copyWith(
      lastCopied: null,
    ));
    Clipboard.setData(ClipboardData(text: state.currentPassword));
    emit(state.copyWith(
      lastCopied: state.currentPassword,
    ));
  }

  void showSaveDialog() {
    emit(state.copyWith(
      showSaveDialog: true,
    ));
  }

  void closeSaveDialog() {
    emit(state.copyWith(
      showSaveDialog: false,
      passwordTitle: '',
    ));
  }

  void passwordTitleChanged(String title) {
    emit(state.copyWith(passwordTitle: title));
  }

  Future<void> savePassword() async {
    await passwordManagerRepository.savePassword(
      state.currentPassword ?? '',
      state.passwordTitle,
    );
    emit(state.copyWith(isSaved: true));
  }
}
