// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:avtonalivator/data/connection/fbs_adapter.dart' as _i5;
import 'package:avtonalivator/data/data_source.dart' as _i14;
import 'package:avtonalivator/data/local_cocktails.dart' as _i7;
import 'package:avtonalivator/data/local_favorite.dart' as _i8;
import 'package:avtonalivator/domain/connection/connector.dart' as _i13;
import 'package:avtonalivator/domain/connection/device_methods.dart' as _i15;
import 'package:avtonalivator/domain/repository/cocktails.dart' as _i17;
import 'package:avtonalivator/domain/repository/config.dart' as _i18;
import 'package:avtonalivator/domain/storage/commands.dart' as _i3;
import 'package:avtonalivator/domain/storage/settings.dart' as _i9;
import 'package:avtonalivator/domain/storage/stats.dart' as _i11;
import 'package:avtonalivator/injection.dart' as _i21;
import 'package:avtonalivator/presentation/fragments/cocktails/provider.dart'
    as _i20;
import 'package:avtonalivator/presentation/fragments/settings/provider.dart'
    as _i10;
import 'package:avtonalivator/presentation/fragments/tuning/provider.dart'
    as _i12;
import 'package:avtonalivator/presentation/pages/home/connection_provider.dart'
    as _i19;
import 'package:avtonalivator/presentation/pages/launch/cubit/launch_cubit.dart'
    as _i6;
import 'package:avtonalivator/presentation/pages/scan/cubit/scan_cubit.dart'
    as _i16;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.CommandsBox>(() => _i3.CommandsBox());
    gh.singleton<_i4.Dio>(registerModule.dio);
    gh.singleton<_i5.FbsAdapter>(_i5.FbsAdapter());
    gh.factory<_i6.LaunchCubit>(() => _i6.LaunchCubit());
    gh.factory<_i7.LocalCocktails>(() => const _i7.LocalCocktails());
    gh.factory<_i8.LocalFavoriteCocktails>(
        () => const _i8.LocalFavoriteCocktails());
    gh.factory<_i9.SettingsBox>(() => _i9.SettingsBox());
    gh.factory<_i10.SettingsProvider>(
        () => _i10.SettingsProvider(gh<_i9.SettingsBox>()));
    gh.factory<_i11.StatsBox>(() => _i11.StatsBox());
    gh.factory<_i12.TuningProvider>(
        () => _i12.TuningProvider(gh<_i9.SettingsBox>()));
    gh.factory<_i13.Connector>(() => _i13.FbsConnector(gh<_i5.FbsAdapter>()));
    gh.factory<_i14.DataSource>(() => _i14.DataSource(gh<_i4.Dio>()));
    gh.factory<_i15.DeviceMethods>(
        () => _i15.FbsDeviceMethods(gh<_i5.FbsAdapter>()));
    gh.factory<_i16.ScanCubit>(() => _i16.ScanCubit(
          gh<_i9.SettingsBox>(),
          gh<_i13.Connector>(),
        ));
    gh.singleton<_i17.CocktailsRepository>(_i17.CocktailsRepository(
      gh<_i14.DataSource>(),
      gh<_i7.LocalCocktails>(),
      gh<_i8.LocalFavoriteCocktails>(),
    ));
    gh.singleton<_i18.ConfigRepository>(
        _i18.ConfigRepository(gh<_i14.DataSource>()));
    gh.factory<_i19.ConnectionProvider>(() => _i19.ConnectionProvider(
          gh<_i15.DeviceMethods>(),
          gh<_i13.Connector>(),
        ));
    gh.factory<_i20.CocktailsProvider>(
        () => _i20.CocktailsProvider(gh<_i17.CocktailsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i21.RegisterModule {}
