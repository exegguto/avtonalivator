import 'package:freezed_annotation/freezed_annotation.dart';

import 'drink.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
class ApiConfig with _$ApiConfig {
  const factory ApiConfig({
    String? accentColor,
    int? drinksQuantity,
  }) = _ApiConfig;

  factory ApiConfig.fromJson(Map<String, dynamic> json) =>
      _$ApiConfigFromJson(json);
}