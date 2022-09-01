import 'package:firemelon/firemelon.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'generator_cubit.freezed.dart';
part 'generator_state.dart';

@injectable
class GeneratorCubit extends Cubit<GeneratorState> {
  final Firemelon firemelon;
  GeneratorCubit(this.firemelon) : super(GeneratorState.initial());

  void complexityChanged(int next) {
    emit(state.copyWith(complexity: next));
    generatePassword();
  }

  void generatePassword() {
    emit(state.copyWith(
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
}
