import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../core/theme.dart';

class PercentIndicator extends StatelessWidget {
  final double percent;
  final String weight;
  final Widget? child;
  final double? radius;
  final bool animation;
  final int duration;

  const PercentIndicator({
    super.key,
    required this.percent,
    required this.weight,
    this.child,
    this.radius,
    this.animation = true,
    this.duration = 1000,
  });

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final radius = this.radius ?? query.size.height * 0.4 / 3;

    return CircularPercentIndicator(
      lineWidth: 10,
      animation: animation,
      animationDuration: duration,
      curve: Curves.easeInOutSine,
      progressColor: Theme.of(context).colorScheme.primary,
      backgroundColor: AppTheme.divider,
      circularStrokeCap: CircularStrokeCap.round,
      radius: radius,
      percent: percent,
      // center: child,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          child ?? Container(),
          Text(
            weight,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
