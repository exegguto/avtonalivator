import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubit/cocktails/cocktails_cubit.dart';
import '../../domain/cubit/connect/connect_cubit.dart';
import '../../domain/cubit/scan/scan_cubit.dart';
import '../../domain/cubit/stats/stats_cubit.dart';
import '../../domain/cubit/tuning/tuning_cubit.dart';
import '../../style.dart';
import '../widgets/common/device_list.dart';
import '../widgets/scan_app_bar.dart';
import 'home_page.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  MultiBlocProvider getHomeProvider([ConnectArgs? args]) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TuningCubit>(create: (_) => TuningCubit()..init()),
        BlocProvider<CocktailsCubit>(create: (_) => CocktailsCubit()..init()),
        BlocProvider<StatsCubit>(create: (_) => StatsCubit()..init()),
        BlocProvider<ConnectCubit>(create: (_) => ConnectCubit(args)..init()),
        BlocProvider<ScanCubit>(create: (_) => ScanCubit()),
      ],
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit, ScanState>(
      listener: (context, state) {
        if (state is ScanConnected) {
          ConnectArgs args = ConnectArgs(
            connection: state.connection,
            name: state.name,
            address: state.address,
          );
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => getHomeProvider(args)));
        }
        if (state is ScanSkipped) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => getHomeProvider()));
        }
      },
      buildWhen: ((prev, next) => next is ScanDevices),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Style.yellow,
          floatingActionButton: FloatingActionButton.extended(
            label: const Text('Пока пропустить'),
            icon: const Icon(Icons.skip_next_rounded),
            onPressed: () => context.read<ScanCubit>().skip(),
          ),
          body: RefreshIndicator(
            edgeOffset: MediaQuery.of(context).viewPadding.top + 260,
            onRefresh: () async => context.read<ScanCubit>().scan(),
            child: CustomScrollView(
              slivers: [
                const ScanAppBar(),
                SliverToBoxAdapter(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).viewPadding.top + 260),
                    ),
                    decoration: const BoxDecoration(
                      color: Style.yellowAccent,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: DeviceList(
                      devices: state is ScanDevices ? state.devices : [],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
