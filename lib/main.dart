import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'di/injection.dart';
import 'features/password_manager/domain/password.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(SavedPassword.adapter);
  await Hive.openBox<SavedPassword>(SavedPassword.boxName);

  await configureDependencies();
  await getIt<SharedPreferences>().clear();

  runApp(const FiremelonApp());
}
