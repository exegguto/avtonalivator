import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/pages/home/home.dart';
import '../presentation/pages/scan/scan.dart';
import '../presentation/pages/start/cubit/start_cubit.dart';
import '../presentation/pages/start/start.dart';
import 'injection.dart';

class AppRoutes {
  static const start = '/start';
  static const scan = '/scan';
  static const home = '/home';

  static const tuning = '/home/tuning';
  static const cocktails = '/home/cocktails';
  static const stats = '/home/stats';
  static const settings = '/home/settings';

  static Route? openPage(RouteSettings settings) {
    final path = settings.name ?? home;
    final mainRoute = '/' + path.split('/')[1];

    switch (mainRoute) {
      case start:
        return _getRoute(
          BlocProvider(
            create: (_) => get<StartCubit>()..init(),
            child: const StartPage(),
          ),
        );
      case scan:
        return _getRoute(const ScanPage());
      case home:
        return _getHomeRoute(path);
    }

    return null;
  }

  static Route _getRoute(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }

  static Route? _getHomeRoute(String path) {
    String subPath = path.replaceAll(home, '');
    if (subPath.isEmpty) subPath = tuning.replaceAll(home, '');

    final route = _homeSubRoutes.firstWhere((r) => r.contains(subPath));
    final index = _homeSubRoutes.indexOf(route);

    return _getRoute(HomePage(index: index));
  }

  static List<String> get _homeSubRoutes => [
        tuning,
        cocktails,
        stats,
        settings,
      ];
}