import 'package:firemelon/firemelon.dart';
import 'package:injectable/injectable.dart';

@module
abstract class IModule {
  @singleton
  Firemelon get firemelon => Firemelon();
}
