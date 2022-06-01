import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../bloc/home/home_bloc.dart';
import '../../bloc/scan/scan_bloc.dart';
import '../widgets/scan/scan_app_bar.dart';
import '../widgets/scan/scan_device_list.dart';
import 'home_page.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  MultiBlocProvider getHomeProvider(BluetoothConnection connection) =>
      MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) =>
                HomeBloc()..add(HomeConnectedEvent(connection: connection)),
          ),
        ],
        child: const HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanBloc, ScanState>(
      listener: (context, state) {
        if (state is ScanDeviceConnectedState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => getHomeProvider(state.connection),
            ),
          );
        } else if (state is ScanConnectionSkippedState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider<HomeBloc>(
                create: (context) => HomeBloc(),
                child: const HomePage(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Style.yellow,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () =>
                context.read<ScanBloc>().add(ScanConnectionSkippedEvent()),
            label: const Text('Пока пропустить'),
            icon: const Icon(Icons.skip_next_rounded),
          ),
          body: state is ScanDevicesFetchedState
              ? CustomScrollView(
                  slivers: [
                    const ScanAppBar(),
                    ScanDeviceList(devices: state.devices),
                  ],
                )
              : const CircularProgressIndicator(),
        );
      },
    );
  }
}
