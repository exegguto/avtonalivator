import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_image.dart';
import '../provider.dart';

class CocktailCard extends StatelessWidget {
  final UiCocktail cocktail;
  final VoidCallback onItemTap;

  const CocktailCard({
    super.key,
    required this.cocktail,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BasicCard(
          onTap: onItemTap,
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