import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../strings.dart';
import '../../../widgets/text_field_label.dart';

class NameDialog extends StatelessWidget {
  final String lastValue;
  final ValueChanged<String> setName;

  const NameDialog({
    super.key,
    required this.lastValue,
    required this.setName,
  });

  void cancel(BuildContext context) {
    setName(lastValue);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(),
      child: AlertDialog(
        content: TextField(
          autofocus: true,
          onChanged: setName,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Label(Strings.enterName),
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () => cancel(context),
            child: const Text(Strings.cancel),
          ),
          FilledButton(
            onPressed: Navigator.of(context).pop,
            child: const Text(Strings.ok),
          ),
        ],
      ),
    );
  }
}
