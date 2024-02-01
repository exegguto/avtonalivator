import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../../domain/model/drink.dart';
import '../../pages/home/connection_provider.dart';
import '../../strings.dart';
import '../../widgets/dialog_helper.dart';
import '../../strings.dart';
import '../cocktails/cocktails.dart';
import 'provider.dart';
import 'widgets/tuning_card.dart';

export 'provider.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final tuning = context.watch<TuningProvider>();
    final cocktails = context.read<CocktailsProvider>();
    final connection = context.read<ConnectionProvider>();

    final cocktail = tuning.cocktail;

    connection.setCocktail(cocktail);

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: Strings.tuning,
                style: AppTheme.pageTitle.copyWith(color: Colors.black),
              ),
              TextSpan(
                text: Strings.totalVolume + context.read<TuningProvider>().getTotalVolume(),
                style: AppTheme.additional.copyWith(
                  color: Colors.black,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              DialogHelper.showCustomDialog(
                context,
                title: Strings.dialogTitle,
                hintText: Strings.dialogName,
                onConfirm: (inputText) {
                  cocktails.save(cocktail.copyWith(name: inputText));
                },
                onCancel: () {},
              );
            }, // cocktails.save(cocktail),
            icon: const Icon(Icons.save_rounded),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: _TuningBody(drinks: cocktail.drinks),
    );
  }
}

class _TuningBody extends StatelessWidget {
  final List<UiDrink> drinks;

  const _TuningBody({required this.drinks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppTheme.padding,
      itemCount: drinks.length,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final drink = drinks[index];
    return TuningCard(
      drink: drink,
      setDrink: context.read<TuningProvider>().updateDrink,
      drinks: context.watch<CocktailsProvider>().drinks,
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
