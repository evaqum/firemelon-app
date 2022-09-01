import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/intro_repository.dart';

@injectable
class IntroScreenCubit extends Cubit<void> {
  final IntroRepository introRepository;
  IntroScreenCubit(this.introRepository) : super(0);

  void startPressed() {
    introRepository.setSeenIntro(true);
  }
}
