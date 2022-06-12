import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home/home_bloc.dart';
import '../../../cubit/connect/connect_cubit.dart';
import '../../../model/pump_model.dart';
import '../common/base_switch.dart';

class TuningCardInner extends StatelessWidget {
  final PumpModel pump;

  const TuningCardInner({Key? key, required this.pump}) : super(key: key);

  TextStyle get numberStyle => TextStyle(
        fontSize: 96,
        color: pump.isEnabled
            ? Style.switchEnabled.withOpacity(0.1)
            : Style.switchDisabled.withOpacity(0.2),
      );

  TextStyle get textStyle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Style.switchEnabled,
      );

  TextStyle get volumeStyle => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: pump.isEnabled
            ? Style.switchEnabled.withOpacity(0.7)
            : Style.switchDisabled,
      );

  SliderThemeData sliderStyle(BuildContext context) =>
      SliderTheme.of(context).copyWith(
        trackHeight: 5,
        activeTrackColor: pump.isEnabled ? Style.switchEnabled : Style.yellow,
        inactiveTrackColor: pump.isEnabled
            ? Style.yellowAccent.withOpacity(0.7)
            : const Color.fromRGBO(237, 237, 237, 1),
        thumbColor: pump.isEnabled ? Style.switchEnabled : Style.yellow,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 5,
          elevation: 0,
          pressedElevation: 0,
        ),
        overlayShape: SliderComponentShape.noOverlay,
      );

  void setVolume(BuildContext context, double value) =>
      setPump(context, pump.copyWith(volume: value));

  void setEnabled(BuildContext context, bool isEnabled) =>
      setPump(context, pump.copyWith(isEnabled: isEnabled));

  void setPump(BuildContext context, PumpModel pump) {
    context.read<HomeBloc>().add(HomeSetPumpEvent(pump: pump));
    context.read<ConnectCubit>().sendRefresh(pump);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -12,
          left: 10,
          child: Text(pump.id.toString(), style: numberStyle),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text('Напиток', style: textStyle),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child:
                          Text('${pump.volume.round()}мл', style: volumeStyle),
                    ),
                    const Expanded(child: SizedBox()),
                    BaseSwitch(
                      value: pump.isEnabled,
                      onToggle: (value) => setEnabled(context, value),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
                child: SliderTheme(
                  data: sliderStyle(context),
                  child: Slider(
                    min: 0,
                    max: 250,
                    divisions: 50,
                    value: pump.volume,
                    onChanged: (value) => setVolume(context, value),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
