// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cocktail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiCocktail _$ApiCocktailFromJson(Map<String, dynamic> json) {
  return _ApiCocktail.fromJson(json);
}

/// @nodoc
mixin _$ApiCocktail {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get recipe => throw _privateConstructorUsedError;
  List<ApiDrink> get drinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiCocktailCopyWith<ApiCocktail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiCocktailCopyWith<$Res> {
  factory $ApiCocktailCopyWith(
          ApiCocktail value, $Res Function(ApiCocktail) then) =
      _$ApiCocktailCopyWithImpl<$Res, ApiCocktail>;
  @useResult
  $Res call(
      {int id,
      String name,
      String imageUrl,
      String description,
      String recipe,
      List<ApiDrink> drinks});
}

/// @nodoc
class _$ApiCocktailCopyWithImpl<$Res, $Val extends ApiCocktail>
    implements $ApiCocktailCopyWith<$Res> {
  _$ApiCocktailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? description = null,
    Object? recipe = null,
    Object? drinks = null,
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
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String,
      drinks: null == drinks
          ? _value.drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as List<ApiDrink>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiCocktailImplCopyWith<$Res>
    implements $ApiCocktailCopyWith<$Res> {
  factory _$$ApiCocktailImplCopyWith(
          _$ApiCocktailImpl value, $Res Function(_$ApiCocktailImpl) then) =
      __$$ApiCocktailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String imageUrl,
      String description,
      String recipe,
      List<ApiDrink> drinks});
}

/// @nodoc
class __$$ApiCocktailImplCopyWithImpl<$Res>
    extends _$ApiCocktailCopyWithImpl<$Res, _$ApiCocktailImpl>
    implements _$$ApiCocktailImplCopyWith<$Res> {
  __$$ApiCocktailImplCopyWithImpl(
      _$ApiCocktailImpl _value, $Res Function(_$ApiCocktailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? description = null,
    Object? recipe = null,
    Object? drinks = null,
  }) {
    return _then(_$ApiCocktailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String,
      drinks: null == drinks
          ? _value._drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as List<ApiDrink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiCocktailImpl implements _ApiCocktail {
  const _$ApiCocktailImpl(
      {required this.id,
      this.name = '',
      this.imageUrl = '',
      this.description = '',
      this.recipe = '',
      final List<ApiDrink> drinks = const []})
      : _drinks = drinks;

  factory _$ApiCocktailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiCocktailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String recipe;
  final List<ApiDrink> _drinks;
  @override
  @JsonKey()
  List<ApiDrink> get drinks {
    if (_drinks is EqualUnmodifiableListView) return _drinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drinks);
  }

  @override
  String toString() {
    return 'ApiCocktail(id: $id, name: $name, imageUrl: $imageUrl, description: $description, recipe: $recipe, drinks: $drinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiCocktailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            const DeepCollectionEquality().equals(other._drinks, _drinks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, description,
      recipe, const DeepCollectionEquality().hash(_drinks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiCocktailImplCopyWith<_$ApiCocktailImpl> get copyWith =>
      __$$ApiCocktailImplCopyWithImpl<_$ApiCocktailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiCocktailImplToJson(
      this,
    );
  }
}

abstract class _ApiCocktail implements ApiCocktail {
  const factory _ApiCocktail(
      {required final int id,
      final String name,
      final String imageUrl,
      final String description,
      final String recipe,
      final List<ApiDrink> drinks}) = _$ApiCocktailImpl;

  factory _ApiCocktail.fromJson(Map<String, dynamic> json) =
      _$ApiCocktailImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get description;
  @override
  String get recipe;
  @override
  List<ApiDrink> get drinks;
  @override
  @JsonKey(ignore: true)
  _$$ApiCocktailImplCopyWith<_$ApiCocktailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
