import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/cocktail.dart';
import '../../../domain/model/drink.dart';
import '../../../domain/repository/cocktails.dart';
import '../../../domain/storage/settings.dart';
import '../../strings.dart';

@injectable
class TuningProvider extends ChangeNotifier {
  final SettingsBox _settings;
  late UiCocktail cocktail;
  final CocktailsRepository _repository;

  List<UiCocktail> _userCocktails = [];
  StreamSubscription? _userCocktailsSub;

  TuningProvider(this._settings, this._repository) {
    final quantity = _settings.drinksQuantity;
    createCocktail(quantity);
    _userCocktailsSub ??= _repository.userCocktails.listen(_setUserCocktails);
  }

  List<UiCocktail> get userCocktails => _userCocktails.toList();

  void _setUserCocktails(List<UiCocktail> cocktails) {
    _userCocktails = cocktails;
    notifyListeners();
  }

  // Future<void> updateCocktail(UiCocktail cocktail) async {
  //   var cocktails = await _repository.editUserCocktail(cocktail);
  //   _setUserCocktails(cocktails);
  // }

  void setCocktail(UiCocktail cocktail) {
    final quantity = _settings.drinksQuantity;
    final drinks = List.generate(
      quantity,
      (index) =>
          cocktail.drinks.elementAtOrNull(index) ?? UiDrink.empty(index + 1),
    );

    cocktail = cocktail.copyWith(drinks: drinks);
    this.cocktail = cocktail;
    notifyListeners();
  }

  void createCocktail(int quantity) {
    final cocktail = UiCocktail.custom(_settings.drinksQuantity);
    setCocktail(cocktail);
  }

  void updateDrink(UiDrink drink) {
    cocktail = cocktail.updateDrink(drink);
    setCocktail(cocktail);
  }

  String getTotalVolume() {
    return cocktail.drinks.fold(0.0, (total, drink) => total + drink.volume).toInt().toString() + Strings.ml;
  }

  List<String> getListName() {
    List<String> nameList= [];
    for(final userCocktail in _userCocktails) {
      nameList.add(userCocktail.name);
    }
    return nameList;
  }
}
