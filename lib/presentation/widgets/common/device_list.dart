import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../../domain/cubit/connect/connect_cubit.dart';
import '../../../domain/cubit/scan/scan_cubit.dart';
import 'device_list_item.dart';

class DeviceList extends StatelessWidget {
  final List<BluetoothDevice> devices;
  final bool directly;

  const DeviceList({
    super.key,
    required this.devices,
    this.directly = false,
  });

  void connect(BuildContext context, String? name, String address) => directly
      ? context.read<ConnectCubit>().connect(name, address)
      : context.read<ScanCubit>().connect(name, address);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: devices
          .map((e) => DeviceListItem(
                device: e,
                onTap: () => connect(context, e.name, e.address),
              ))
          .toList(),
    );
  }
}
