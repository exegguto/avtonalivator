import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//
// class AppTheme {
//   static const _accent = Color(0xFFFAD960);
//   static final accent = _createMaterialColor(_accent);
//   static const error = Colors.redAccent;
//
//   static const black = Color(0xFF010002);
//   static const green = Color(0xFF007C00);
//   static const greenButton = Color(0xFF70F070);
//   static const grey = Color(0xFF828282);
//   static const greyLight = Color(0xFFC4C4C4);
//   static const divider = Color(0xFFEDEDED);
//   static const background = Colors.white;
//   static const red = Colors.red;
//
//   static const paddingValue = 15.0;
//   static const padding = EdgeInsets.all(paddingValue);
//   static const horizontalPadding =
//       EdgeInsets.symmetric(horizontal: paddingValue);
//   static const listPadding = EdgeInsets.symmetric(
//       vertical: paddingValue * 2, horizontal: paddingValue);
//
//   static const radius = Radius.circular(20);
//   static const borderRadius = BorderRadius.all(Radius.circular(20));
//   static const border = OutlineInputBorder(borderRadius: borderRadius);
//   static const duration = Duration(milliseconds: 200);
//
//   static final value = ThemeData(
//     useMaterial3: true,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     colorSchemeSeed: accent,
//     scaffoldBackgroundColor: background,
//     textTheme: GoogleFonts.rubikTextTheme(),
//     appBarTheme: const AppBarTheme(
//       backgroundColor: background,
//       centerTitle: true,
//     ),
//     progressIndicatorTheme: ProgressIndicatorThemeData(
//       color: Color.lerp(AppTheme.accent, AppTheme.black, 0.1),
//     ),
//     sliderTheme: SliderThemeData(
//       trackHeight: 5,
//       overlayShape: SliderComponentShape.noOverlay,
//       activeTickMarkColor: Colors.transparent,
//       inactiveTickMarkColor: Colors.transparent,
//       thumbShape: const RoundSliderThumbShape(
//         elevation: 0,
//         pressedElevation: 0,
//         enabledThumbRadius: 5,
//       ),
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: AppTheme.background,
//       border: border,
//       enabledBorder: border.copyWith(
//         borderSide: const BorderSide(color: AppTheme.greyLight),
//       ),
//       hintStyle: textLight.copyWith(color: grey),
//       labelStyle: textLight.copyWith(color: grey),
//       helperStyle: textLight.copyWith(color: grey),
//       contentPadding: const EdgeInsets.symmetric(
//         vertical: paddingValue / 3,
//         horizontal: paddingValue,
//       ),
//     ),
//   );
//
//   static final pageTitle = GoogleFonts.raleway(
//     fontSize: 20,
//     fontWeight: FontWeight.w700,
//   );
//
//   static const text = TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w500,
//     color: black,
//   );
//
//   static const textLight = TextStyle(
//     fontSize: 14,
//     color: greyLight,
//   );
//
//   static const additional = TextStyle(
//     fontSize: 10,
//     color: grey,
//   );
// }
//
// MaterialColor _createMaterialColor(Color color) {
//   return MaterialColor(color.value, {
//     50: color.withOpacity(0.05),
//     100: color.withOpacity(0.1),
//     200: color.withOpacity(0.2),
//     300: color.withOpacity(0.3),
//     400: color.withOpacity(0.4),
//     500: color.withOpacity(0.5),
//     600: color.withOpacity(0.6),
//     700: color.withOpacity(0.7),
//     800: color.withOpacity(0.8),
//     900: color.withOpacity(0.9),
//   });
// }


class AppTheme {
  static const _accent = Color(0xFFFAD960);
  static final accent = _createMaterialColor(_accent);

  static const _accentDark = Color(0xFF2E2B1F);
  static final accentDark = _createMaterialColor(_accentDark);

  static const error = Colors.redAccent;

  static const black = Color(0xFF010002);
  static const green = Color(0xFF007C00);
  static const greenButton = Color(0xFF70F070);
  static const grey = Color(0xFF828282);
  static const greyDark = Color(0xFFCECECE);
  static const greyLight = Color(0xFFC4C4C4);
  static const divider = Color(0xFFEDEDED);
  static const background = Colors.white;
  static const backgroundDark = Colors.black;
  static const greenDark = Color(0xFF493E1D);
  static const red = Colors.red;

  static const paddingValue = 15.0;
  static const padding = EdgeInsets.all(paddingValue);
  static const horizontalPadding =
  EdgeInsets.symmetric(horizontal: paddingValue);
  static const listPadding = EdgeInsets.symmetric(
      vertical: paddingValue * 2, horizontal: paddingValue);

  static const radius = Radius.circular(20);
  static const borderRadius = BorderRadius.all(Radius.circular(20));
  static const border = OutlineInputBorder(borderRadius: borderRadius);
  static const duration = Duration(milliseconds: 200);

  static final lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.light(
      primary: accent,
      secondary: accent,
      background: background,
    ),
    scaffoldBackgroundColor: background,
    textTheme: GoogleFonts.rubikTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      centerTitle: true,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color.lerp(accent, black, 0.1),
    ),
    sliderTheme: SliderThemeData(
      trackHeight: 5,
      overlayShape: SliderComponentShape.noOverlay,
      activeTickMarkColor: Colors.transparent,
      inactiveTickMarkColor: Colors.transparent,
      thumbShape: const RoundSliderThumbShape(
        elevation: 0,
        pressedElevation: 0,
        enabledThumbRadius: 5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: background,
      border: border,
      enabledBorder: border.copyWith(
        borderSide: const BorderSide(color: greyLight),
      ),
      hintStyle: textLight.copyWith(color: grey),
      labelStyle: textLight.copyWith(color: grey),
      helperStyle: textLight.copyWith(color: grey),
      contentPadding: const EdgeInsets.symmetric(
        vertical: paddingValue / 3,
        horizontal: paddingValue,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // backgroundColor: greyLight,
        foregroundColor: black,
        textStyle: const TextStyle(fontSize: 18),
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size(double.infinity, 48),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: black, // Цвет текста
      backgroundColor: accent, // Цвет фона кнопки
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: greenDark,
        side: const BorderSide(color: greenDark),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: greenDark, // Заливка серая
        foregroundColor: background, // Цвет текста как цвет фона
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.dark(
      primary: accentDark,
      secondary: accentDark,
      background: backgroundDark,
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: GoogleFonts.rubikTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundDark,
      centerTitle: true,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color.lerp(accentDark, backgroundDark, 0.1),
    ),
    sliderTheme: SliderThemeData(
      trackHeight: 5,
      overlayShape: SliderComponentShape.noOverlay,
      activeTickMarkColor: Colors.transparent,
      inactiveTickMarkColor: Colors.transparent,
      thumbShape: const RoundSliderThumbShape(
        elevation: 0,
        pressedElevation: 0,
        enabledThumbRadius: 5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.black,
      border: border,
      enabledBorder: border.copyWith(
        borderSide: const BorderSide(color: grey),
      ),
      hintStyle: textLight.copyWith(color: greyLight),
      labelStyle: textLight.copyWith(color: greyLight),
      helperStyle: textLight.copyWith(color: greyLight),
      contentPadding: const EdgeInsets.symmetric(
        vertical: paddingValue / 3,
        horizontal: paddingValue,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // backgroundColor: greyLight,
        foregroundColor: grey,
        textStyle: const TextStyle(fontSize: 18),
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size(double.infinity, 48),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white, // Цвет текста
      backgroundColor: accent, // Цвет фона кнопки
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: greenDark,
        side: const BorderSide(color: greenDark),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: greenDark, // Заливка серая
        foregroundColor: background, // Цвет текста как цвет фона
      ),
    ),
  );

  static final pageTitle = GoogleFonts.raleway(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const text = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: black,
  );

  static const textLight = TextStyle(
    fontSize: 14,
    color: greyLight,
  );

  static const additional = TextStyle(
    fontSize: 10,
    color: grey,
  );
}

MaterialColor _createMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: color.withOpacity(0.05),
    100: color.withOpacity(0.1),
    200: color.withOpacity(0.2),
    300: color.withOpacity(0.3),
    400: color.withOpacity(0.4),
    500: color.withOpacity(0.5),
    600: color.withOpacity(0.6),
    700: color.withOpacity(0.7),
    800: color.withOpacity(0.8),
    900: color.withOpacity(0.9),
  });
}
