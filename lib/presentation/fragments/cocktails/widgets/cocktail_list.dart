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

  const CocktailsList({
    super.key,
    required this.cocktails,
    this.controller,
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
    final item = cocktails[index];
    final cocktailsContext = context.read<CocktailsProvider>();
    var icon = Icon(Icons.star_border);
    // если мы в избранном, то удалить кнопку либо по этой же кнопке
    // if(false) icon = Icon(Icons.star);

    return CocktailCard(
      cocktail: item,
      onItemTap: (cocktail) => showDetail(context, cocktail),
      onSaveFavorite: (id) => cocktailsContext.saveFavorite(item),
      iconFavorite: icon,
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
