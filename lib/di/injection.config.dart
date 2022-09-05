// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firemelon/firemelon.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../features/core/application/cubit/intro_cubit.dart' as _i9;
import '../features/core/data/preferences_repository.dart' as _i8;
import '../features/generator/application/cubit/generator_screen_cubit.dart'
    as _i6;
import '../features/password_manager/application/cubit/password_manager_cubit.dart'
    as _i7;
import '../features/password_manager/data/password_manager_repository.dart'
    as _i4;
import 'module.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final iModule = _$IModule();
  gh.singleton<_i3.Firemelon>(iModule.firemelon);
  gh.singleton<_i4.PasswordManagerRepository>(_i4.PasswordManagerRepository());
  await gh.singletonAsync<_i5.SharedPreferences>(
      () => iModule.sharedPreferences,
      preResolve: true);
  gh.factory<_i6.GeneratorScreenCubit>(() => _i6.GeneratorScreenCubit(
      firemelon: get<_i3.Firemelon>(),
      passwordManagerRepository: get<_i4.PasswordManagerRepository>()));
  gh.factory<_i7.PasswordManagerCubit>(
      () => _i7.PasswordManagerCubit(get<_i4.PasswordManagerRepository>()));
  gh.singleton<_i8.PreferencesRepository>(
      _i8.PreferencesRepository(get<_i5.SharedPreferences>()));
  gh.factory<_i9.IntroCubit>(
      () => _i9.IntroCubit(get<_i8.PreferencesRepository>()));
  return get;
}

class _$IModule extends _i10.IModule {}
