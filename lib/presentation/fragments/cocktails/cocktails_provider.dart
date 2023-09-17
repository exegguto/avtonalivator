import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/cocktail.dart';
import '../../../domain/repository/cocktails_repository.dart';
import '../../utils.dart';

@injectable
class CocktailsProvider extends ChangeNotifier {
  final CocktailsRepository _repository;

  CocktailsProvider(this._repository) {
    _cocktailsSubscription?.cancel();
    _cocktailsSubscription = _repository.cocktails.listen(_setCocktails);
  }

  String _searchPattern = '';
  List<UiCocktail> _cocktails = [];
  StreamSubscription? _cocktailsSubscription;

  List<UiCocktail> get cocktails => _cocktails
      .where((cocktail) => cocktail.name.search(_searchPattern))
      .toList();

  List<String> get drinks => _cocktails
      .expand((cocktail) => cocktail.drinks)
      .map((drink) => drink.name)
      .toList();

  void _setCocktails(List<UiCocktail> cocktails) {
    _cocktails = cocktails;
    notifyListeners();
  }

  void searchCocktail(String pattern) {
    _searchPattern = pattern;
    notifyListeners();
  }

  @override
  void dispose() {
    _cocktailsSubscription?.cancel();
    return super.dispose();
  }
}