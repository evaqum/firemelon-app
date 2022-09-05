import 'package:firemelon/firemelon.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class IModule {
  @singleton
  Firemelon get firemelon => Firemelon();

  @singleton
  @preResolve
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}
