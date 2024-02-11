import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../cocktails.dart';
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
    print('rewrite itemBuilder: ${cocktails[index]}');
    return CocktailCard(
        cocktail: cocktails[index],
        index: index,
        onItemTap: () => showDetail(context, index)
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}

typedef EditFunction = Future<void> Function(UiCocktail cocktail);
