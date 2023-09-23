import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router.dart';
import '../../../core/theme.dart';
import '../../../domain/model/device.dart';
import '../../../domain/model/param.dart';
import '../../connection/connection_provider.dart';
import '../../strings.dart';
import '../../widgets/barmen_card.dart';
import '../../widgets/loader.dart';
import '../../widgets/sliver_scaffold.dart';
import 'cubit/settings_cubit.dart';
import 'widgets/settings_card.dart';

export 'cubit/settings_cubit.dart';

part 'widgets/app_bar.dart';

void _disconnect(BuildContext context) {
  context.read<ConnectionProvider>().disconnect();
}

void _goScan(BuildContext context) {
  Navigator.of(context).pushReplacementNamed(AppRoutes.scan);
}

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: builder,
    );
  }

  Widget builder(BuildContext context, SettingsState state) {
    final appBar = MediaQuery.of(context).size.height * 0.4;
    final device = context.watch<ConnectionProvider>().device;

    return SliverScaffold(
      sliverAppBar: SettingsAppBar(
        height: appBar,
        isConnecting: false,
        device: device,
        onTap: device == null
            ? () => _goScan(context)
            : () => _disconnect(context),
      ),
      body: state is! SettingsFulfilled ? const Loader() : null,
      bodyBuilder: state is SettingsFulfilled
          ? (_, controller) {
              return _SettingsList(
                controller: controller,
                params: state.params,
              );
            }
          : null,
    );
  }
}

class _SettingsList extends StatelessWidget {
  final ScrollController controller;
  final List<Param> params;

  const _SettingsList({
    required this.controller,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: controller,
      padding: AppTheme.listPadding,
      itemCount: params.length,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = params[index];
    return SettingsCard(param: item);
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
