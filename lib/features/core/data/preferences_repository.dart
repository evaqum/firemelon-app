import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class PreferencesRepository {
  final SharedPreferences sharedPreferences;
  const PreferencesRepository(this.sharedPreferences);

  Future<bool> getSeenIntro() async {
    return sharedPreferences.getBool('seenIntro') ?? false;
  }

  Future<void> setSeenIntro(bool seenIntro) {
    return sharedPreferences.setBool('seenIntro', seenIntro);
  }
}
