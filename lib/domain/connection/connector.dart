import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/model/device.dart';
import '../../data/connection/fbs_adapter.dart';
import '../logger.dart';
import '../model/device_data.dart';

const _streamDuration = Duration(milliseconds: 400);

abstract interface class Connector {
  UiDevice? get device;

  Stream<bool> get isDiscovering;

  Stream<UiDevice> get devices;

  Future<void> cancelDiscovery();

  Future<bool> connect(UiDevice device);

  Future<void> sendCommand(String command);

  Stream<DeviceData> get input;

  Future<void> disconnect();
}

@Injectable(as: Connector)
class FbsConnector implements Connector {
  final FbsAdapter _connector;

  FbsConnector(this._connector);

  @override
  UiDevice? get device {
    final device = _connector.device;
    final result = device == null ? null : UiDevice.fromLib(device);
    return result;
  }

  @override
  Stream<bool> get isDiscovering async* {
    while (device == null) {
      yield await Future.delayed(
          _streamDuration, () => _connector.isDiscovering);
    }
  }

  @override
  Stream<UiDevice> get devices {
    return _connector.devices.map(UiDevice.fromLib);
  }

  @override
  Future<void> cancelDiscovery() {
    return _connector.cancelDiscovery();
  }

  @override
  Future<bool> connect(UiDevice device) async {
    final libDevice = device.toLib();
    final connection = await _connector.connect(libDevice);
    return connection != null;
  }

  @override
  Future<void> sendCommand(String command) {
    Logger.log(command, 'Command');
    command = '$command\r';

    final chars = utf8.encode(command);
    final bytes = Uint8List.fromList(chars);

    return _connector.send(bytes);
  }

  @override
  Stream<DeviceData> get input {
    return _connector.input.distinct(listEquals).map(DeviceData.fromBytes);
  }

  @override
  Future<void> disconnect() {
    return _connector.disconnect();
  }
}