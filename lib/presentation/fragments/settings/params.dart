part of 'settings.dart';

class _Params {
  final BuildContext context;
  late final List<Param> list;
  int lastActionValue = 0;

  _Params(this.context) {
    final settings = context.watch<SettingsProvider>();
    final connection = context.read<ConnectionProvider>();

    list = [
      Param.deviceModal(
        key: ParamKey.buyCoaster,
        title: 'Купить подставку',
        onTap:  () => launchUrls(),
        color: AppTheme.greenButton,
      ),
      Param.deviceModal(
        key: ParamKey.urlConfig,
        title: Strings.urlConfig,
        onTap: () async {
          showDialog(
            context: context,
            builder: (_) => ChangeNotifierProvider.value(
              value: context.read<ConnectionProvider>(),
              child: const ReviewDialog(),
            ),
          );
        },
        color: AppTheme.greenButton
      ),
      Param.stored(
        provider: settings,
        key: ParamKey.autoConnect,
        title: Strings.autoConnectTitle,
        description: Strings.autoConnectDescription,
        defaultValue: true,
      ),
      // Param.stored(
      //   provider: settings,
      //   key: ParamKey.drinksQuantity,
      //   title: Strings.drinksQuantityTitle,
      //   defaultValue: 6,
      //   maxValue: 12.0,
      //   onChanged: (v) => context.read<TuningProvider>().createCocktail(v),
      // ),
      Param.deviceModal(
        key: ParamKey.calibration,
        title: Strings.calibrateTitle,
        onTap: () => showDialog(
          context: context,
          builder: (_) => ChangeNotifierProvider.value(
            value: context.read<ConnectionProvider>(),
            child: CalibrationDialog(),
          ),
        ),
      ),
      Param.deviceModal(
        key: ParamKey.lightningMode,
        title: Strings.lightningMode,
        onTap: () => showDialog(
          context: context,
          builder: (_) => ChangeNotifierProvider.value(
            value: context.read<ConnectionProvider>(),
            child: const LightningDialog(),
          ),
        ),
      ),
      Param.stored(
        provider: settings,
        key: ParamKey.lightningBrightness,
        title: Strings.lightningBrightness,
        defaultValue: 0,
        maxValue: 100.0,
        onChanged: (v) {
          // int scaledValue = (v / 5).round() * 5;
          // if ((scaledValue - lastActionValue).abs() >= 5) {
            connection.setLightningBrightness(v);
            // lastActionValue = v;
          // }
        },
      ),
      // Param.deviceToggleAction(
      //   key: ParamKey.themeMode,
      //   title: 'Выбор темы',
      //   // description: 'Выберите текущую погоду',
      //   icons: const <Widget>[
      //     Icon(Icons.sunny),
      //     Icon(Icons.dark_mode),
      //     Text("Auto"),
      //   ],
      //   isSelected: List<bool>.generate(3, (index) => index == context.read<ThemeProvider>().themeModeIndex),
      //   onPressed: (int index) {
      //     final themeProvider = context.read<ThemeProvider>();
      //     themeProvider.setThemeMode(index);
      //   },
      // ),
    ];

    const typesMap = ParamKey.typesMap;
    assert(list.length == typesMap.keys.length);
  }

  void launchUrls() async {
    try {
      final configRepository = GetIt.I.get<ConfigRepository>();
      AppConfig config = await configRepository.getConfig();
      final url = config.urlGoogle;

      if (url != null) {
        final uri = Uri.parse(url);
        await launchUrl(uri);
      } else {
        print('URL is null');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
