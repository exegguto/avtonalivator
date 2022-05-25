import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/launch/launch_bloc.dart';
import 'scan_page.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  void requestEnable(BuildContext context) =>
      context.read<LaunchBloc>().add(LaunchInitialEvent());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LaunchBloc>(
      create: (context) => LaunchBloc()..add(LaunchInitialEvent()),
      child: BlocConsumer<LaunchBloc, LaunchState>(
        listener: (context, state) {
          if (state is LaunchStatusFetchedState && state.isEnabled) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ScanPage()),
            );
          }
        },
        builder: (context, state) => Scaffold(
          body: Center(
            child: state is! LaunchStatusFetchedState
                ? const CircularProgressIndicator()
                : !state.isAvailable
                    ? const Text('Bluetooth is not supported by your device')
                    : !state.isEnabled
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Bluetooth is not enabled'),
                              TextButton(
                                  onPressed: () => requestEnable(context),
                                  child: const Text('Enable Bluetooth')),
                            ],
                          )
                        : const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
