import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/router.dart';
import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../../../../domain/model/drink.dart';
import '../../../strings.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_image.dart';
import '../../tuning/provider.dart';
import '../provider.dart';
import 'name_dialog.dart';
import 'name_picker.dart';
import 'volume_dialog.dart';

const _horizontal = AppTheme.horizontalPadding;

/// Устанавливает выбранный коктейль в приготовление
void setCocktail(BuildContext context, UiCocktail cocktail) {
  context.read<TuningProvider>().setCocktail(cocktail);
  Navigator.of(context).pop();
  AppRoutes.setHomeIndex(0);
}

void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }
  (context as Element).visitChildren(rebuild);
}

void showDetail(BuildContext contextA, int index){
  showModalBottomSheet(
    context: contextA,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: AppTheme.radius),
    ),
    builder: (bottomSheetContext) {
      print('rewrite showModalBottomSheet');
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.8,
        builder: (context, controller) {
          List<String>? drinks;
          final cocktailsContext = contextA.read<CocktailsProvider>();
          var icon = const Icon(Icons.star_border);

          var cocktailA = contextA.watch<CocktailsProvider>();
          var cocktailAll = cocktailA.seeCocktails;
          var cocktail = cocktailAll[index];

          final providerType = cocktailsContext.item;
          switch(providerType) {
            case 1:
              icon = Icon(Icons.star, color: Theme.of(context).colorScheme.primary);
              break;
            case 2:
              icon = const Icon(Icons.delete_forever, color: AppTheme.red);
              drinks = cocktailsContext.drinks;
              cocktail = contextA.watch<CocktailsProvider>().userCocktails[index];
              break;
          }

          print('rewrite DraggableScrollableSheet: $cocktail');
          return CocktailDetail(
            drinks: drinks,
            cocktail: cocktail,
            setCocktail: () => setCocktail(contextA, cocktail),
            controller: controller,
            onSaveFavorite: (cocktailA) {
              switch(providerType){
                case 0: cocktailsContext.saveFavorite(cocktail); break;
                case 1: cocktailsContext.deleteFavorite(cocktailA); break;
                case 2: cocktailsContext.delete(cocktailA); break;
              }
              Navigator.pop(bottomSheetContext);
            },
            iconFavorite: icon,
            onEditDrink: (drink) {
              cocktailsContext.updateDrink(drink, index);
              rebuildAllChildren(bottomSheetContext);
            },
            onEditCocktail: (cocktail) => cocktailsContext.updateCocktail(cocktail, index),
          );
        },
      );
    },
  );
}

class CocktailDetail extends StatelessWidget {
  final List<String>? drinks;
  final UiCocktail cocktail;
  final VoidCallback? setCocktail;
  final ScrollController? controller;
  final ValueChanged<UiCocktail> onSaveFavorite;
  final Icon iconFavorite;
  final ValueChanged<UiDrink> onEditDrink;
  final ValueChanged<UiCocktail> onEditCocktail;

  const CocktailDetail({
    super.key,
    required this.drinks,
    required this.cocktail,
    this.setCocktail,
    this.controller,
    required this.onSaveFavorite,
    required this.iconFavorite,
    required this.onEditDrink,
    required this.onEditCocktail,
  });

  void setName(String name, UiDrink drink) {
    final volumeType = cocktail.getVolumeTypeByName(name);
    final newDrink = drink.copyWith(name: name, volumeType: volumeType);
    print('setName: $volumeType');
    print('setName: $newDrink');
    return onEditDrink(newDrink);
  }

  void openNamePicker(BuildContext context, UiDrink drink) {
    print('openNamePicker: $drink');
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NamePicker(
          drinks: drinks!,
          setDrink: (name) => setName(name, drink),
        );
      },
    );
  }

  void setNameCocktail(String name) {
    final newCocktail = cocktail.copyWith(name: name);
    return onEditCocktail(newCocktail);
  }

  void openNameField(BuildContext context) {
    final lastValue = cocktail.name;
    showDialog(
      context: context,
      builder: (_) {
        return NameDialog(
          lastValue: lastValue,
          setName: setNameCocktail,
        );
      },
    );
  }

  void setValueCocktail(UiDrink drink, double volume) {
    final newDrink = drink.copyWith(volume: volume);
    print('setValueCocktail: $drink');
    print('setValueCocktail: $newDrink');
    return onEditDrink(newDrink);
  }

  void openValueField(BuildContext context, UiDrink drink, double value) {
    print('openValueField: $drink');
    final lastValue = value;
    showDialog(
      context: context,
      builder: (_) {
        return VolumeDialog(
          lastValue: lastValue,
          setVolume: (value) => setValueCocktail(drink, value),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('rewrite CocktailDetail: $cocktail');
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          controller: controller,
          children: [
            BasicImage(
              cocktail.image,
              borderRadius: const BorderRadius.vertical(top: AppTheme.radius),
            ),
            Padding(
              padding: _horizontal.copyWith(top: 30, bottom: 120),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (drinks != null) openNameField(context);
                          },
                          child: Padding(
                            padding: _horizontal,
                            child: Text(
                              cocktail.name,
                              style: AppTheme.pageTitle.copyWith(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => onSaveFavorite(cocktail),
                        icon: iconFavorite,
                        iconSize: 32.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  if (cocktail.recipe.isNotEmpty)
                    Padding(
                      padding: _horizontal,
                      child: Text(cocktail.recipe),
                    ),
                  const SizedBox(height: 15),
                  ...cocktail.drinks.map((drink) =>
                      _DrinkCard(
                        drink: drink,
                        gap: 10,
                        cocktail: cocktail,
                        onEditDrink: (value) {
                          if (drinks != null) openNamePicker(context, value);
                        },
                        onEditVolume: (value) {
                          if (drinks != null) openValueField(context, drink, value);
                        },
                      )).toList(),
                  const SizedBox(height: 15),
                  if (cocktail.description.isNotEmpty)
                    Padding(
                      padding: _horizontal,
                      child: Text(cocktail.description),
                    ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: FloatingActionButton.extended(
            onPressed: setCocktail,
            icon: const Icon(Icons.water_drop),
            label: const Text(Strings.goPour),
          ),
        ),
      ],
    );
  }
}

class _DrinkCard extends StatelessWidget {
  final UiDrink drink;
  final double gap;
  final UiCocktail cocktail;
  final ValueChanged<UiDrink> onEditDrink; // Колбэк для сохранения коктейля
  final ValueChanged<double> onEditVolume;

  const _DrinkCard({
    required this.drink,
    required this.gap,
    required this.cocktail,
    required this.onEditDrink,
    required this.onEditVolume,
  });

  @override
  Widget build(BuildContext context) {
    print('rewrite _DrinkCard: $cocktail');
    return BasicCard(
      color: AppTheme.background,
      padding: AppTheme.padding,
      margin: EdgeInsets.only(bottom: gap),
      child: Row(
        children: [
          const Icon(
            Icons.local_drink_rounded,
            size: 36,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: InkWell(
              onTap: () => onEditDrink(drink),
              child: Text(drink.name),
            ),
          ),
          const SizedBox(width: 8),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () => onEditVolume(drink.volume),
              child: Text('${drink.volume} ${drink.volumeType}'),
            ),
          ),
        ],
      ),
    );
  }
}
