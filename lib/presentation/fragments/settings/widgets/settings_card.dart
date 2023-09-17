import 'package:flutter/cupertino.dart';

import '../../../../core/theme.dart';
import '../../../widgets/basic_card.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasicCard(
      padding: EdgeInsets.all(20),
      color: AppTheme.white,
      child: Text('Card'),
    );
  }
}
