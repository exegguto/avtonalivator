// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drink.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiDrink _$ApiDrinkFromJson(Map<String, dynamic> json) {
  return _ApiDrink.fromJson(json);
}

/// @nodoc
mixin _$ApiDrink {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get volume => throw _privateConstructorUsedError;
  String get volumeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiDrinkCopyWith<ApiDrink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiDrinkCopyWith<$Res> {
  factory $ApiDrinkCopyWith(ApiDrink value, $Res Function(ApiDrink) then) =
      _$ApiDrinkCopyWithImpl<$Res, ApiDrink>;
  @useResult
  $Res call({int id, String name, int volume, String volumeType});
}

/// @nodoc
class _$ApiDrinkCopyWithImpl<$Res, $Val extends ApiDrink>
    implements $ApiDrinkCopyWith<$Res> {
  _$ApiDrinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? volume = null,
    Object? volumeType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
      volumeType: null == volumeType
          ? _value.volumeType
          : volumeType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiDrinkImplCopyWith<$Res>
    implements $ApiDrinkCopyWith<$Res> {
  factory _$$ApiDrinkImplCopyWith(
          _$ApiDrinkImpl value, $Res Function(_$ApiDrinkImpl) then) =
      __$$ApiDrinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int volume, String volumeType});
}

/// @nodoc
class __$$ApiDrinkImplCopyWithImpl<$Res>
    extends _$ApiDrinkCopyWithImpl<$Res, _$ApiDrinkImpl>
    implements _$$ApiDrinkImplCopyWith<$Res> {
  __$$ApiDrinkImplCopyWithImpl(
      _$ApiDrinkImpl _value, $Res Function(_$ApiDrinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? volume = null,
    Object? volumeType = null,
  }) {
    return _then(_$ApiDrinkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
      volumeType: null == volumeType
          ? _value.volumeType
          : volumeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiDrinkImpl implements _ApiDrink {
  const _$ApiDrinkImpl(
      {this.id = 0, this.name = '', this.volume = 0, this.volumeType = ''});

  factory _$ApiDrinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiDrinkImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int volume;
  @override
  @JsonKey()
  final String volumeType;

  @override
  String toString() {
    return 'ApiDrink(id: $id, name: $name, volume: $volume, volumeType: $volumeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDrinkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.volumeType, volumeType) ||
                other.volumeType == volumeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, volume, volumeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDrinkImplCopyWith<_$ApiDrinkImpl> get copyWith =>
      __$$ApiDrinkImplCopyWithImpl<_$ApiDrinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiDrinkImplToJson(
      this,
    );
  }
}

abstract class _ApiDrink implements ApiDrink {
  const factory _ApiDrink(
      {final int id,
      final String name,
      final int volume,
      final String volumeType}) = _$ApiDrinkImpl;

  factory _ApiDrink.fromJson(Map<String, dynamic> json) =
      _$ApiDrinkImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get volume;
  @override
  String get volumeType;
  @override
  @JsonKey(ignore: true)
  _$$ApiDrinkImplCopyWith<_$ApiDrinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
