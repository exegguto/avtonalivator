// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiDrinkImpl _$$ApiDrinkImplFromJson(Map<String, dynamic> json) =>
    _$ApiDrinkImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      volume: (json['volume'] as num?)?.toInt() ?? 0,
      volumeType: json['volumeType'] as String? ?? '',
    );

Map<String, dynamic> _$$ApiDrinkImplToJson(_$ApiDrinkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'volume': instance.volume,
      'volumeType': instance.volumeType,
    };
