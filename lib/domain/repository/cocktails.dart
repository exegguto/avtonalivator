import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/data_source.dart';
import '../../data/local_cocktails.dart';
import '../../data/local_favorite.dart';
import '../model/cocktail.dart';

@singleton
class CocktailsRepository {
  final DataSource _source;
  final LocalCocktails _local;
  final LocalFavoriteCocktails _favorite;

  final _hostCocktails = BehaviorSubject<List<UiCocktail>>.seeded([]);
  final _userCocktails = BehaviorSubject<List<UiCocktail>>.seeded([]);
  final _favoriteCocktails = BehaviorSubject<List<UiCocktail>>.seeded([]);

  CocktailsRepository(this._source, this._local, this._favorite) {
    getCocktails().then(_hostCocktails.add);
    getLocal().then(_userCocktails.add);
    getFavorite().then(_favoriteCocktails.add);
  }

  Stream<List<UiCocktail>> get hostCocktails => _hostCocktails;
  Stream<List<UiCocktail>> get userCocktails => _userCocktails;
  Stream<List<UiCocktail>> get favoriteCocktails => _favoriteCocktails;

  Future<List<UiCocktail>> getCocktails() async {
    final list = await _source.getCocktails();
    final cocktails = list.map(UiCocktail.fromApi).toList();
    return cocktails;
  }

  Future<List<UiCocktail>> getLocal() async {
    final list = await _local.getCocktails();
    final cocktails = list.map(UiCocktail.fromApi).toList();
    return cocktails;
  }

  Future<void> saveCocktail(UiCocktail cocktail) async {
    final api = cocktail.toApi(true);
    await _local.saveCocktail(api);
    getLocal().then(_userCocktails.add);
    await _source.postCocktail(api);
  }

  Future<void> deleteCocktail(UiCocktail cocktail) async {
    final api = cocktail.toApi(false);
    await _local.deleteCocktail(api);
  }

  Future<void> deleteFavoriteCocktail(UiCocktail cocktail) async {
    final api = cocktail.toApi(false);
    await _favorite.deleteCocktail(api);
  }

  Future<void> saveFavoriteCocktail(UiCocktail cocktail) async {
    final api = cocktail.toApi(false);
    await _favorite.saveCocktail(api);
    getFavorite().then(_favoriteCocktails.add);
    await _source.postCocktail(api);
  }

  Future<List<UiCocktail>> getFavorite() async {
    final list = await _favorite.getFavorite();
    final cocktails = list.map(UiCocktail.fromApi).toList();
    return cocktails;
  }

  Future<void> editUserCocktail(UiCocktail cocktail) async {
    print('Step editUserCocktail');
    final api = cocktail.toApi(false);
    await _local.editCocktail(api);
  }
}
