// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiConfig _$ApiConfigFromJson(Map<String, dynamic> json) {
  return _ApiConfig.fromJson(json);
}

/// @nodoc
mixin _$ApiConfig {
  String? get accentColor => throw _privateConstructorUsedError;
  String? get urlGoogle => throw _privateConstructorUsedError;
  String? get BuyCoaster => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiConfigCopyWith<ApiConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiConfigCopyWith<$Res> {
  factory $ApiConfigCopyWith(ApiConfig value, $Res Function(ApiConfig) then) =
      _$ApiConfigCopyWithImpl<$Res, ApiConfig>;
  @useResult
  $Res call({String? accentColor, String? urlGoogle, String? BuyCoaster});
}

/// @nodoc
class _$ApiConfigCopyWithImpl<$Res, $Val extends ApiConfig>
    implements $ApiConfigCopyWith<$Res> {
  _$ApiConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accentColor = freezed,
    Object? urlGoogle = freezed,
    Object? BuyCoaster = freezed,
  }) {
    return _then(_value.copyWith(
      accentColor: freezed == accentColor
          ? _value.accentColor
          : accentColor // ignore: cast_nullable_to_non_nullable
              as String?,
      urlGoogle: freezed == urlGoogle
          ? _value.urlGoogle
          : urlGoogle // ignore: cast_nullable_to_non_nullable
              as String?,
      BuyCoaster: freezed == BuyCoaster
          ? _value.BuyCoaster
          : BuyCoaster // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiConfigImplCopyWith<$Res>
    implements $ApiConfigCopyWith<$Res> {
  factory _$$ApiConfigImplCopyWith(
          _$ApiConfigImpl value, $Res Function(_$ApiConfigImpl) then) =
      __$$ApiConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? accentColor, String? urlGoogle, String? BuyCoaster});
}

/// @nodoc
class __$$ApiConfigImplCopyWithImpl<$Res>
    extends _$ApiConfigCopyWithImpl<$Res, _$ApiConfigImpl>
    implements _$$ApiConfigImplCopyWith<$Res> {
  __$$ApiConfigImplCopyWithImpl(
      _$ApiConfigImpl _value, $Res Function(_$ApiConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accentColor = freezed,
    Object? urlGoogle = freezed,
    Object? BuyCoaster = freezed,
  }) {
    return _then(_$ApiConfigImpl(
      accentColor: freezed == accentColor
          ? _value.accentColor
          : accentColor // ignore: cast_nullable_to_non_nullable
              as String?,
      urlGoogle: freezed == urlGoogle
          ? _value.urlGoogle
          : urlGoogle // ignore: cast_nullable_to_non_nullable
              as String?,
      BuyCoaster: freezed == BuyCoaster
          ? _value.BuyCoaster
          : BuyCoaster // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiConfigImpl implements _ApiConfig {
  const _$ApiConfigImpl({this.accentColor, this.urlGoogle, this.BuyCoaster});

  factory _$ApiConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiConfigImplFromJson(json);

  @override
  final String? accentColor;
  @override
  final String? urlGoogle;
  @override
  final String? BuyCoaster;

  @override
  String toString() {
    return 'ApiConfig(accentColor: $accentColor, urlGoogle: $urlGoogle, BuyCoaster: $BuyCoaster)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiConfigImpl &&
            (identical(other.accentColor, accentColor) ||
                other.accentColor == accentColor) &&
            (identical(other.urlGoogle, urlGoogle) ||
                other.urlGoogle == urlGoogle) &&
            (identical(other.BuyCoaster, BuyCoaster) ||
                other.BuyCoaster == BuyCoaster));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accentColor, urlGoogle, BuyCoaster);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiConfigImplCopyWith<_$ApiConfigImpl> get copyWith =>
      __$$ApiConfigImplCopyWithImpl<_$ApiConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiConfigImplToJson(
      this,
    );
  }
}

abstract class _ApiConfig implements ApiConfig {
  const factory _ApiConfig(
      {final String? accentColor,
      final String? urlGoogle,
      final String? BuyCoaster}) = _$ApiConfigImpl;

  factory _ApiConfig.fromJson(Map<String, dynamic> json) =
      _$ApiConfigImpl.fromJson;

  @override
  String? get accentColor;
  @override
  String? get urlGoogle;
  @override
  String? get BuyCoaster;
  @override
  @JsonKey(ignore: true)
  _$$ApiConfigImplCopyWith<_$ApiConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
