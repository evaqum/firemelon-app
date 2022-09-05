import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../domain/password.dart';

@singleton
class PasswordManagerRepository {
  final box = Hive.box<SavedPassword>(SavedPassword.boxName);

  List<SavedPassword> getSavedPasswords() {
    return box.values.toList();
  }

  Stream<List<SavedPassword>> savedPasswordsStream() async* {
    yield getSavedPasswords();
    yield* box.watch().map((_) => getSavedPasswords());
  }

  Future<void> savePassword(
    String password,
    String title,
  ) {
    return box.add(SavedPassword(
      password: password,
      title: title,
    ));
  }

  Future<void> deleteSavedPassword(SavedPassword password) {
    return box.delete(password.key);
  }

  Future<void> changeSavedPasswordTitle(SavedPassword password, String title) {
    return box.put(
      password.key,
      password.copyWith(title: title),
    );
  }
}
