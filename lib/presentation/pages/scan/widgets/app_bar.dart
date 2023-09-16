part of '../scan.dart';

class ScanAppBar extends StatelessWidget {
  final double height;
  final bool isConnecting;

  const ScanAppBar({
    super.key,
    required this.height,
    required this.isConnecting,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      collapsedHeight: kToolbarHeight,
      expandedHeight: height,
      backgroundColor: AppTheme.accent,
      title: Text(Strings.connection, style: AppTheme.pageTitle),
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
            child: BarmenCard(isConnecting: isConnecting),
          ),
        ),
      ),
      actions: [
        StreamBuilder<bool>(
          stream: context.read<ScanCubit>().isDiscovering,
          initialData: false,
          builder: (_, snapshot) => Center(
            child: snapshot.data != true
                ? null
                : Center(
                    child: Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.all(12),
                      child: const CircularProgressIndicator(
                        color: AppTheme.black,
                        strokeWidth: 3,
                      ),
                    ),
                  ),
          ),
        )
      ],
    );
  }
}