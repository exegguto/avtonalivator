part of '../launch.dart';

class LaunchBody extends StatelessWidget {
  final bool noPermission;
  final bool notAvailable;
  final bool notEnabled;

  const LaunchBody({
    super.key,
    required this.noPermission,
    required this.notAvailable,
    required this.notEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(builder: switchState),
    );
  }

  Widget switchState(BuildContext context) {
    if (noPermission) return _NoPermission();
    if (notAvailable) return _NotAvailable();
    if (notEnabled) return _NotEnabled();
    return const SizedBox();
  }
}

class _NoPermission extends StatelessWidget {
  void openSettings(BuildContext context) {
    openAppSettings();
    Navigator.of(context).pushReplacementNamed(AppRoutes.launch);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(Strings.btNoPermission),
        const SizedBox(height: 100),
        ElevatedButton(
          onPressed: () => openSettings(context),
          style: ElevatedButton.styleFrom(
            foregroundColor: AppTheme.black,
            backgroundColor: Theme.of(context).colorScheme.primary,
            minimumSize: const Size(0, 60),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: AppTheme.borderRadius,
            ),
          ),
          child: const Text(Strings.btGoSettings),
        ),
      ],
    );
  }
}

class _NotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      Strings.btUnavailable,
      style: AppTheme.text,
    );
  }
}

class _NotEnabled extends StatelessWidget {
  void requestEnable(BuildContext context) {
    context.read<LaunchCubit>().requestEnable();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          Strings.btDisabled,
          style: AppTheme.text,
        ),
        const SizedBox(height: 100),
        ElevatedButton(
          onPressed: () => requestEnable(context),
          style: ElevatedButton.styleFrom(
            foregroundColor: AppTheme.black,
            backgroundColor: Theme.of(context).colorScheme.primary,
            minimumSize: const Size(0, 60),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: AppTheme.borderRadius,
            ),
          ),
          child: const Text(Strings.btEnable),
        ),
      ],
    );
  }
}
