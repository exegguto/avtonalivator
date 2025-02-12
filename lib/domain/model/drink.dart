import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/drink.dart';
import '../../presentation/strings.dart';
import '../string_utils.dart';
import 'cocktail.dart';

class UiDrink extends Equatable {
  static final chars = '_:a:b:c:d:e:f:g:h:i:j:k:l'.split(':').toList();

  final int id;
  final String name;
  final double volume;
  final String volumeType;
  final bool enabled;

  const UiDrink({
    required this.id,
    required this.name,
    required this.volume,
    required this.volumeType,
    required this.enabled,
  });

  static const base = UiDrink(id: 0, name: '', volume: 25, volumeType: Strings.ml, enabled: true);

  factory UiDrink.fromApi(int id, ApiDrink drink) {
    return UiDrink(
      id: id,
      name: drink.name,
      volume: drink.volume.toDouble(),
      volumeType: drink.volumeType,
      enabled: drink.volume != 0,
    );
  }

  factory UiDrink.empty(int id) {
    return UiDrink(id: id, name: '', volume: 25, volumeType: Strings.ml, enabled: false);
  }

  UiDrink copyWith({
    int? id,
    String? name,
    double? volume,
    String? volumeType,
    bool? enabled,
  }) {
    return UiDrink(
      id: id ?? this.id,
      name: name ?? this.name,
      volume: volume ?? this.volume,
      volumeType: volumeType ?? this.volumeType,
      enabled: enabled ?? this.enabled,
    );
  }

  String get char => chars[id];

  String get command {
    final value = enabled ? volume.round() : 0;
    return '$char$value';
  }

  /// Находит напиток, соответствующий названию ингредиента,
  /// включает помпу и устанавливает объём.
  /// Если напиток не найден, помпа выключается.
  UiDrink mapCocktail(UiCocktail cocktail) {
    final drink = cocktail.drinks.firstWhereOrNull((d) => d.name.equals(name));
    return _setDrink(drink);
  }

  UiDrink _setDrink(UiDrink? drink) {
    final result = drink == null
        ? copyWith(enabled: false)
        : copyWith(
            name: drink.name,
            volume: drink.volume.toDouble(),
            volumeType: drink.volumeType,
            enabled: true,
          );
    return result;
  }

  @override
  List<Object?> get props => [id, name, volume, volumeType, enabled];

  /// Реализация PrimaryKey
  @override
  int get hashCode => id.hashCode;

  /// Реализация PrimaryKey
  @override
  bool operator ==(Object other) {
    return other is UiDrink && id == other.id;
  }

  ApiDrink toApi() {
    return ApiDrink(
      name: name,
      volume: volume.round(),
      volumeType: volumeType,
    );
  }
}
