import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../provider.dart';
import 'cocktail_card.dart';
import 'detail.dart';

class CocktailsList extends StatelessWidget {
  final List<UiCocktail> cocktails;
  final ScrollController? controller;
  final int providerType;

  const CocktailsList({
    super.key,
    required this.cocktails,
    this.controller,
    required this.providerType
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: controller,
      padding: AppTheme.listPadding,
      itemCount: cocktails.length,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final cocktailsContext = context.read<CocktailsProvider>();
    final item = cocktails[index];
    var icon = const Icon(Icons.star_border);
    List<String>? drinksList;

    EditFunction editFunction = (cocktail) => cocktailsContext.saveFavorite(cocktail);

    switch(providerType) {
      case 1:
        icon = Icon(Icons.star, color: AppTheme.accent);
        editFunction = (cocktail) => cocktailsContext.deleteFavorite(cocktail);
        break;
      case 2:
        icon = const Icon(Icons.delete_forever, color: AppTheme.red);
        editFunction = (cocktail) => cocktailsContext.delete(cocktail);
        drinksList = cocktailsContext.drinks;
        break;
    }

    return CocktailCard(
        cocktail: item,
        onItemTap: () => {
          showDetail(
            context,
            item,
            icon,
            editFunction,
            drinksList,
            cocktailsContext.updateCocktail,
            cocktailsContext.updateDrink,
          ),
        });
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}

typedef EditFunction = Future<void> Function(UiCocktail cocktail);
