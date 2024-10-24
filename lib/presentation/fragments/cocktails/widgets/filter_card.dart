import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../strings.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_switch.dart';

class FilterCard extends StatelessWidget {
  final bool isActive;
  final ValueChanged<bool> onChanged;

  const FilterCard({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppTheme.duration,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      decoration: BoxDecoration(
        boxShadow: BasicCard.defaultShadow,
        color: isActive ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(100),
      ),
      child: BasicCard(
        onTap: () => onChanged(!isActive),
        padding: AppTheme.padding,
        child: Row(
          children: [
            const Icon(Icons.check_circle_outline_rounded),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                Strings.readyForPouring,
                style: AppTheme.text,
              ),
            ),
            const SizedBox(width: 8),
            BasicSwitch(
              value: isActive,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
