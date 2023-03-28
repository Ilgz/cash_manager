// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cash_manager/infrastructure/core/app_injectable_module.dart'
    as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appInjectableProdModule = _$AppInjectableProdModule();
    gh.lazySingleton<_i3.Client>(() => appInjectableProdModule.httpClient);
    gh.lazySingleton<_i4.FlutterSecureStorage>(
        () => appInjectableProdModule.storage);
    await gh.factoryAsync<_i5.SharedPreferences>(
      () => appInjectableProdModule.sharedPreferences,
      preResolve: true,
    );
    return this;
  }
}

class _$AppInjectableProdModule extends _i6.AppInjectableProdModule {}
