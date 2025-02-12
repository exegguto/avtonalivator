import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../presentation/fragments/settings/provider.dart';
import 'lightning_mode.dart';

class ParamKey {
  static const urlConfig = 'urlConfig';
  static const autoConnect = 'autoConnect';
  // static const drinksQuantity = 'drinksQuantity';
  static const calibration = 'calibration';
  static const lightningMode = 'lightningMode';
  static const lightningBrightness = 'lightningBrightness';
  static const themeMode = 'themeMode';
  static const buyCoaster = 'buyCoaster';

  static const typesMap = {
    urlConfig: double,
    autoConnect: bool,
    // drinksQuantity: int,
    calibration: null,
    lightningMode: LightingMode,
    lightningBrightness: int,
    buyCoaster: double,
    // themeMode: List<bool>,
  };
}

class Param extends Equatable {
  final Type? type;
  final String key;
  final String title;
  final String description;
  final dynamic value;
  final dynamic maxValue;
  final Function action;
  final Color? color;
  final List<Widget>? icons;


  Param._({
    required this.type,
    required this.key,
    required this.title,
    required this.description,
    required this.value,
    required this.maxValue,
    required this.action,
    required this.color,
    this.icons,
  });

  /// Параметр приложения, сохраняемый в телефоне
  factory Param.stored({
    required SettingsProvider provider,
    required String key,
    required String title,
    String? description,
    required dynamic defaultValue,
    dynamic maxValue,
    ValueChanged<dynamic>? onChanged,
  }) {
    return Param._(
      type: ParamKey.typesMap[key],
      key: key,
      title: title,
      description: description ?? '',
      value: provider.getParam(key, defaultValue),
      maxValue: maxValue,
      action: (v) {
        if(key == 'lightningBrightness'){
          var value = provider.lastSentValue;
          if(v%5 == 0 && v != value){
            provider.setParam(key, v);
            onChanged?.call(v);
            provider.setValue(v);
          }
        } else {
          provider.setParam(key, v);
          onChanged?.call(v);
        }

        // provider.lastSentValue;
        // provider.setParam(key, v);
        // onChanged?.call(v);
      },
      color: AppTheme.background,
    );
  }

  /// Параметр устройства, с диалоговым окном
  factory Param.deviceModal({
    required String key,
    required String title,
    String? description,
    required VoidCallback onTap,
    Color? color
  }) {
    return Param._(
      type: ParamKey.typesMap[key],
      key: key,
      title: title,
      description: description ?? '',
      value: null,
      maxValue: null,
      action: onTap,
      color: color ?? AppTheme.background,
    );
  }

  /// Параметр устройства, для отправки данных
  factory Param.deviceAction({
    required String key,
    required String title,
    String? description,
    dynamic value,
    dynamic maxValue,
    required ValueChanged<dynamic> sendValue,
  }) {
    return Param._(
      type: ParamKey.typesMap[key],
      key: key,
      title: title,
      description: description ?? '',
      value: value ?? 0,
      maxValue: maxValue,
      action: sendValue,
      color: AppTheme.background,
    );
  }

  factory Param.deviceToggleAction({
    required String key,
    required String title,
    String? description,
    required List<Widget> icons, // Иконки или виджеты для кнопок
    required List<bool> isSelected, // Состояния выбранных кнопок
    required Function(int) onPressed, // Функция для обработки выбора
  }) {
    return Param._(
      type: List<bool>, // Указываем тип
      key: key,
      title: title,
      description: description ?? '',
      value: isSelected,
      maxValue: null,
      icons: icons,
      action: onPressed, // Присваиваем действие
      color: AppTheme.background,
    );
  }

  @override
  List<Object?> get props => [
        key,
        title,
        description,
        value,
        action,
      ];
}
