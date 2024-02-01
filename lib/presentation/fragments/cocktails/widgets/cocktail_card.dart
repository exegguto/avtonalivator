import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_image.dart';

class CocktailCard extends StatelessWidget {
  final UiCocktail cocktail;
  final ValueChanged<UiCocktail> onItemTap;
  final ValueChanged<UiCocktail> onSaveFavorite; // Колбэк для сохранения коктейля
  final Icon iconFavorite;

  const CocktailCard({
    super.key,
    required this.cocktail,
    required this.onItemTap,
    required this.onSaveFavorite, // Добавляем это в конструктор
    required this.iconFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BasicCard(
          onTap: () => onItemTap(cocktail),
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
        Positioned(
          top: 0,
          bottom: 0,
          right: 10,
          child: Center(
            child: IconButton(
                onPressed: () => onSaveFavorite(cocktail), // Использование колбэка для сохранения
                icon: iconFavorite,
            ),
          ),
        ),
      ],
    );
  }
}
