import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../parse_utils.dart';
import 'commandmanager.dart';
import 'device_mode.dart';

export 'device_mode.dart';

class DeviceData extends Equatable {
  final double weight;
  final int percent;
  final DeviceMode mode;
  final int step;
  final List<int> volumes;

  const DeviceData({
    this.weight = 0,
    this.percent = 0,
    this.mode = DeviceMode.wait,
    this.step = 0,
    this.volumes = const [],
  });

  factory DeviceData.fromBytes(Uint8List bytes) {
    final data = utf8.decode(bytes);
    CommandManager.addCommand('IN:  $data'); // Сохранить команду
    print('utf8.decode data: $data');
    return DeviceData._fromString(data);
  }

  factory DeviceData._fromString(String data) {
    return _parseData(data);
  }

  bool containsInvalidCharacter() {
    return this.toString().contains('-');
  }

  DeviceData copyWith({
    double? weight,
    int? percent,
    DeviceMode? mode,
    int? step,
    List<int>? volumes,
  }) {
    return DeviceData(
      weight: weight ?? this.weight,
      percent: percent ?? this.percent,
      mode: mode ?? this.mode,
      step: step ?? this.step,
      volumes: volumes ?? this.volumes,
    );
  }

  @override
  List<Object?> get props => [
        weight,
        percent,
        mode,
        step,
        volumes,
      ];
}

DeviceData _parseData(String data) {
  final parts = data.split('; ');

  final ves = parts.find('ves').value.asNumber;
  final per = parts.find('now_percent').value.asNumber;
  final mode = parts.find('mode').value.asNumber;
  final step = parts.find('step').value.asNumber;
  final ml = parts.find('ml').value.split(', ').map((e) => e.asNumber);

  return DeviceData(
    weight: ves.toDouble(),
    percent: per.round(),
    mode: DeviceMode.fromNumber(mode.round()),
    step: step.round(),
    volumes: ml.map((e) => e.round()).toList(),
  );
}
