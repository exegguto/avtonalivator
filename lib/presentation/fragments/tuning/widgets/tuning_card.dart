import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/drink.dart';
import '../../../strings.dart';
import '../../../widgets/animated_text.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_switch.dart';
import 'name_picker.dart';
import 'volume_dialog.dart';

const _maxVolume = 1000.0;
const _duration = AppTheme.duration;

class TuningCard extends StatelessWidget {
  final UiDrink drink;
  final ValueChanged<UiDrink> setDrink;
  final List<String> drinks;
  final VoidCallback onDelete;

  const TuningCard({
    super.key,
    required this.drink,
    required this.setDrink,
    required this.drinks,
    required this.onDelete,
  });

  // * Logic

  bool get isActive => drink.enabled;

  void setName(String name) {
    final newDrink = drink.copyWith(name: name);
    return setDrink(newDrink);
  }

  void setVolume(double volume) {
    final newDrink = drink.copyWith(volume: volume);
    return setDrink(newDrink);
  }

  void setEnabled(bool active) {
    final newDrink = drink.copyWith(enabled: active);
    return setDrink(newDrink);
  }

  // * Modals

  void openNamePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NamePicker(
          drinks: drinks,
          setDrink: setName,
        );
      },
    );
  }

  void openVolumeField(BuildContext context) {
    final lastValue = drink.volume;
    showDialog(
      context: context,
      builder: (_) {
        return VolumeDialog(
          lastValue: lastValue,
          setVolume: setVolume,
        );
      },
    );
  }

  // * Presentation

  String get pickerTitle {
    return drink.name.isEmpty ? Strings.pickDrink : drink.name;
  }

  String get volume {
    return '${drink.volume.toStringAsFixed(0)} ${drink.volumeType}';
  }

  @override
  Widget build(BuildContext context) {
    final numberStyle = TextStyle(
      fontSize: 100,
      height: 1,
      color: isActive
          ? AppTheme.black.withOpacity(0.1)
          : AppTheme.greyLight.withOpacity(0.2),
    );

    final textStyle = AppTheme.text.copyWith(height: 1);
    final volumeStyle = textStyle.copyWith(
        color: isActive ? AppTheme.black.withOpacity(0.7) : AppTheme.greyLight);

    return AnimatedContainer(
      duration: _duration,
      decoration: BoxDecoration(
        boxShadow: BasicCard.defaultShadow,
        color: isActive ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 8,
            left: 14,
            right: null,
            child: Center(
              child: AnimatedText(
                drink.id.toString(),
                duration: _duration,
                style: numberStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: BasicCard(
                          onTap: () => openNamePicker(context),
                          height: 50,
                          padding: const EdgeInsets.only(left: 50, right: 0),
                          alignment: Alignment.centerLeft,
                          child: AnimatedText(
                            pickerTitle,
                            duration: _duration,
                            style: textStyle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      BasicCard(
                        onTap: () => openVolumeField(context),
                        height: 50,
                        padding: AppTheme.horizontalPadding,
                        alignment: Alignment.centerLeft,
                        child: AnimatedText(
                          volume,
                          duration: _duration,
                          style: volumeStyle,
                        ),
                      ),
                      BasicSwitch(
                        value: isActive,
                        onChanged: setEnabled,
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: onDelete,
                      ),
                    ],
                  ),
                ),
                SliderTheme(
                  data: sliderStyle(context),
                  child: SizedBox(
                    height: 40,
                    child: Slider(
                      min: 0,
                      max: max(drink.volume, _maxVolume),
                      divisions: 200,
                      value: drink.volume,
                      onChanged: setVolume,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliderThemeData sliderStyle(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      thumbColor: isActive ? AppTheme.black : Theme.of(context).colorScheme.primary,
      activeTrackColor: isActive ? AppTheme.black : Theme.of(context).colorScheme.primary,
      inactiveTrackColor:
          isActive ? Theme.of(context).colorScheme.background.withOpacity(0.7) : AppTheme.divider,
    );
  }
}
