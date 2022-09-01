// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firemelon/firemelon.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/core/application/cubit/intro_cubit.dart' as _i7;
import '../features/generator/application/cubit/generator_cubit.dart' as _i4;
import '../features/intro/cubit/intro_screen_cubit.dart' as _i6;
import '../features/intro/data/intro_repository.dart' as _i5;
import 'module.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final iModule = _$IModule();
  gh.singleton<_i3.Firemelon>(iModule.firemelon);
  gh.factory<_i4.GeneratorCubit>(
      () => _i4.GeneratorCubit(get<_i3.Firemelon>()));
  gh.singleton<_i5.IntroRepository>(_i5.IntroRepository());
  gh.factory<_i6.IntroScreenCubit>(
      () => _i6.IntroScreenCubit(get<_i5.IntroRepository>()));
  gh.factory<_i7.IntroCubit>(() => _i7.IntroCubit(get<_i5.IntroRepository>()));
  return get;
}

class _$IModule extends _i8.IModule {}
