import 'package:freezed_annotation/freezed_annotation.dart';

part 'drink.freezed.dart';
part 'drink.g.dart';

@freezed
class ApiDrink with _$ApiDrink {
  const factory ApiDrink({
    @Default(0) int id,
    @Default('') String name,
    @Default(0) int volume,
    @Default('') String volumeType,
  }) = _ApiDrink;

  factory ApiDrink.fromJson(Map<String, dynamic> json) =>
      _$ApiDrinkFromJson(json);
}
