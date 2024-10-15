import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';
import '../../fragments/cocktails/cocktails.dart';
import '../../fragments/settings/provider.dart';
import '../../fragments/settings/settings.dart';
import '../../fragments/tuning/tuning.dart';
import '../../strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late int index = 0;

  void setIndex(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// В TuningFragment свой Scaffold
      primary: index != 0,
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => get<TuningProvider>()),
          ChangeNotifierProvider(create: (_) => get<CocktailsProvider>()),
          ChangeNotifierProvider(create: (_) => get<SettingsProvider>()),
        ],
        child: bodies[index],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: setIndex,
        selectedIndex: index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.tune_rounded),
            label: Strings.tuning,
          ),
          NavigationDestination(
            icon: Icon(Icons.liquor_rounded),
            label: Strings.cocktails,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_rounded),
            label: Strings.settings,
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.insert_chart_outlined_outlined),
          //   label: Strings.stats,
          // ),
        ],
      ),
    );
  }

  static const bodies = [
    TuningFragment(),
    CocktailsFragment(),
    SettingsFragment(),
    // StatsFragment(),
  ];
}
