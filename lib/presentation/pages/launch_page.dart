import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubit/launch/launch_cubit.dart';
import '../../domain/cubit/scan/scan_cubit.dart';
import '../widgets/launch_splash.dart';
import '../widgets/launch_status_page.dart';
import 'scan_page.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaunchCubit, LaunchState>(
      listener: (context, state) {
        if (state is LaunchStatus && state.isEnabled) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider<ScanCubit>(
                create: (context) => ScanCubit()..init(),
                child: const ScanPage(),
              ),
            ),
          );
        }
      },
      buildWhen: ((prev, next) => !(next is LaunchStatus && next.isEnabled)),
      builder: (context, state) {
        return state is LaunchStatus
            ? LaunchStatusPage(
                isAvailable: state.isAvailable,
                isEnabled: state.isEnabled,
              )
            : LaunchSplash(
                animate: state is LaunchAnimate,
                duration: const Duration(milliseconds: 750),
              );
      },
    );
  }
}
