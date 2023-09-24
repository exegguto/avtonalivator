import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../core/theme.dart';

class PercentIndicator extends StatelessWidget {
  final double percent;
  final Widget child;
  final double? radius;
  final int duration;

  const PercentIndicator({
    super.key,
    required this.percent,
    required this.child,
    this.radius,
    this.duration = 1000,
  });

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final radius = this.radius ?? query.size.height * 0.4 / 3;

    return CircularPercentIndicator(
      lineWidth: 10,
      animation: true,
      animationDuration: duration,
      curve: Curves.easeInOutSine,
      progressColor: AppTheme.accent,
      backgroundColor: AppTheme.divider,
      circularStrokeCap: CircularStrokeCap.round,
      radius: radius,
      percent: percent,
      center: child,
    );
  }
}
