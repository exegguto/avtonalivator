import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_image.dart';
import 'detail.dart';

class CocktailCard extends StatelessWidget {
  final UiCocktail cocktail;
  final int index;
  final VoidCallback onItemTap;

  const CocktailCard({
    super.key,
    required this.cocktail,
    required this.onItemTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BasicCard(
          onTap: () => showDetail(context, index),
          color: AppTheme.background,
          padding: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(50),
          child: Row(
            children: [
              ClipOval(
                child: BasicImage(
                  cocktail.image,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(cocktail.name),
              ),
            ],
          ),
        ),
      ],
    );
  }
}