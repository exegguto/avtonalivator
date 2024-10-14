import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/router.dart';
import 'core/setup.dart';
import 'core/theme.dart';
import 'domain/model/commandmanager.dart';
import 'material.dart';
import 'presentation/strings.dart';

const isDebug = kDebugMode;

void main() {
  CommandManager.initialize();
  if (isDebug) {
    setupApp().then((_) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider(),
          ),
          // другие провайдеры, если нужны
        ],
        child: const MyApp(),
      ),
    ));
  } else {
    runZonedGuarded(
          () => setupApp().then((_) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeProvider>(
              create: (_) => ThemeProvider(),
            ),
            // другие провайдеры, если нужны
          ],
          child: const MyApp(),
        ),
      )),
          (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeProvider>().themeMode;

    return MaterialApp(
      title: Strings.autoBartender,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,  // Используем режим из SettingsProvider
      initialRoute: AppRoutes.launch,
      onGenerateRoute: AppRoutes.openPage,
    );
  }
}