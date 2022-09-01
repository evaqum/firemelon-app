import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class IntroRepository {
  static const boxName = 'intro';
  final Box<bool> box = Hive.box(boxName);

  Future<bool> getSeenIntro() async => box.get('seenIntro', defaultValue: false)!;
  Future<void> setSeenIntro(bool seenIntro) => box.put('seenIntro', seenIntro);

  static Future<void> openOwnBox() => Hive.openBox<bool>(boxName);
}
