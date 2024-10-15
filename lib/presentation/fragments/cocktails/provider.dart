import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/cocktail.dart';
import '../../../domain/model/drink.dart';
import '../../../domain/repository/cocktails.dart';
import '../../../domain/string_utils.dart';

@injectable
class CocktailsProvider extends ChangeNotifier {
  final CocktailsRepository _repository;

  int item = 0;
  List<UiCocktail> _cocktails = [];
  List<UiCocktail> _userCocktails = [];
  List<UiCocktail> _userFavorite = [];
  StreamSubscription? _cocktailsSub;
  StreamSubscription? _userCocktailsSub;
  StreamSubscription? _userFavoriteSub;

  CocktailsProvider(this._repository) {
    _cocktailsSub ??= _repository.hostCocktails.listen(_setCocktails);
    _userCocktailsSub ??= _repository.userCocktails.listen(_setUserCocktails);
    _userFavoriteSub ??= _repository.favoriteCocktails.listen(_setFavoriteCocktails);
  }

  String _searchPattern = '';
  List<String> _tuningDrinks = [];

  bool useFilter = false;

  List<UiCocktail> get cocktails => _cocktails
      .where((c) => !useFilter || c.contains(_tuningDrinks))
      .where((c) => c.name.search(_searchPattern))
      .toList()
      ..sort((a, b) => a.name.compareTo(b.name));

  List<UiCocktail> get favCocktails => _userFavorite
      .where((c) => !useFilter || c.contains(_tuningDrinks))
      .where((c) => c.name.search(_searchPattern))
      .toList()
      ..sort((a, b) => a.name.compareTo(b.name));

  List<UiCocktail> get userCocktails => _userCocktails
      .where((c) => !useFilter || c.contains(_tuningDrinks))
      .where((c) => c.name.search(_searchPattern))
      .toList()
      ..sort((a, b) => a.name.compareTo(b.name));

  List<UiCocktail> get seeCocktails {
    switch (item) {
      case 0: return cocktails;
      case 1: return favCocktails;
      case 2: return userCocktails;
      default: return []; // Или другое дефолтное значение
    }
  }


  List<String> get drinks =>
      _cocktails.expand((c) => c.drinkNames).toSet().toList();

  String? getVolumeTypeByDrinkName(String drinkName) {
    final drink = _cocktails
        .expand((cocktail) => cocktail.drinks)
        .firstWhereOrNull((drink) => drink.name == drinkName);

    return drink?.volumeType;
  }

  void searchCocktail(String pattern) {
    _searchPattern = pattern;
    notifyListeners();
  }

  void setFilter(bool value, List<String> drinks) {
    _tuningDrinks = drinks;
    useFilter = value;
    notifyListeners();
  }

  Future<void> save(UiCocktail cocktail) {
    return _repository.saveCocktail(cocktail);
  }

  Future<void> delete(UiCocktail cocktail) async {
    await _repository.deleteCocktail(cocktail);

    // Перезагрузка данных из репозитория
    await _reloadCocktails();
  }

  Future<void> _reloadCocktails() async {
    var cocktails = await _repository.getLocal();
    _setUserCocktails(cocktails);
  }

  List<UiCocktail> cocktailSearch(List<UiCocktail> list, UiCocktail cocktail){
    for (var i = 0; i < list.length; i++) {
      if (list[i].id == cocktail.id) list[i] = cocktail;
    }
    return list;
  }

  Future<void> updateCocktail(UiCocktail cocktail, index) async {
    if(index == -1) {
      _userCocktails = cocktailSearch(_userCocktails, cocktail);
    } else {
      _userCocktails = List.from(_userCocktails)..[index] = cocktail;
    }
    notifyListeners();
    await _repository.editUserCocktail(cocktail);
  }

  // Save favorite cocktail
  Future<void> saveFavorite(UiCocktail cocktail) {
    return _repository.saveFavoriteCocktail(cocktail);
  }

  Future<void> deleteFavorite(UiCocktail cocktail) async {
    await _repository.deleteFavoriteCocktail(cocktail);
    await _reloadFavorites();
  }

  Future<void> _reloadFavorites() async {
    var favorites = await _repository.getFavorite();
    _setFavoriteCocktails(favorites);
  }

  // * Private

  void _setCocktails(List<UiCocktail> cocktails) {
    _cocktails = cocktails;
    notifyListeners();
  }

  void _setUserCocktails(List<UiCocktail> cocktails) {
    _userCocktails = cocktails;
    notifyListeners();
  }

  void _setFavoriteCocktails(List<UiCocktail> cocktails) {
    _userFavorite = cocktails;
    notifyListeners();
  }

  @override
  void dispose() {
    _cocktailsSub?.cancel();
    _userCocktailsSub?.cancel();
    _userFavoriteSub?.cancel();
    return super.dispose();
  }

  void updateDrink(UiDrink drink, int index) {
    var editCocktail = _userCocktails[index];
    editCocktail = editCocktail.updateDrink(drink);
    updateCocktail(editCocktail, index);
  }
}
