import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/theme.dart';
import '../../../domain/model/device_data.dart';
import '../../strings.dart';
import '../../widgets/percent_indicator.dart';
import 'connection_provider.dart';

class PourModal extends StatelessWidget {

  PourModal({super.key});
  bool hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConnectionProvider>();
    final data = provider.data;
    final drink = provider.drink;
    final value = data.percent / 100;
    final weight = data.weight;
    final step = data.step;
    final nameList = provider.drinks;
    final drinkNamesAndVolumeTypes = provider.drinksVolume;

    final finish = data.mode == DeviceMode.wait && data.step == 0;
    if (finish && !hasNavigated) {
      hasNavigated = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pop();
      });
    }

    return _ModalData(drink: drink, value: value, valWeight: weight, step: step, nameList: nameList,
    volumeType: drinkNamesAndVolumeTypes);
  }
}

class _ModalData extends StatelessWidget {
  final String? drink;
  final double value;
  final double valWeight;
  final int step;
  final List<String> nameList;
  final String? volumeType;

  const _ModalData({
    required this.drink,
    required this.value,
    required this.valWeight,
    required this.step,
    required this.nameList,
    required this.volumeType,
  });

  int get _percent => (value * 100).round();

  String get percent => '$_percent%';
  String get weight => '$valWeight $volumeType';

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppTheme.listPadding,
      controller: PrimaryScrollController.of(context),
      children: [
        Padding(
          padding: AppTheme.padding,
          child: PercentIndicator(
            percent: min(value, 1),
            weight: weight,
            animation: false,
            child: Text(
              percent,
              style: GoogleFonts.inter(
                fontSize: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        ...nameList.asMap().map((i, str) => MapEntry(i, Text(
          str.isNotEmpty ? str : Strings.notNameCocktails,
          textAlign: TextAlign.center,
          style: TextStyle(
            decoration: i < (step-1) ? TextDecoration.lineThrough : null,
            decorationColor: Colors.red,
            fontSize: 16,
            color: i == (step-1) ? AppTheme.green : AppTheme.grey,
            fontWeight: i == (step-1) ? FontWeight.bold : FontWeight.w300,
          ),
        ))).values.toList(),

        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(Strings.cancel),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
