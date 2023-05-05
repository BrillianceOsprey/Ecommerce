// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_domain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartDomain _$CartDomainFromJson(Map<String, dynamic> json) {
  return _CartDomain.fromJson(json);
}

/// @nodoc
mixin _$CartDomain {
  String get cartId => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartDomainCopyWith<CartDomain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDomainCopyWith<$Res> {
  factory $CartDomainCopyWith(
          CartDomain value, $Res Function(CartDomain) then) =
      _$CartDomainCopyWithImpl<$Res, CartDomain>;
  @useResult
  $Res call(
      {String cartId,
      String productId,
      String title,
      String imageUrl,
      double price,
      int quantity});
}

/// @nodoc
class _$CartDomainCopyWithImpl<$Res, $Val extends CartDomain>
    implements $CartDomainCopyWith<$Res> {
  _$CartDomainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? productId = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartDomainCopyWith<$Res>
    implements $CartDomainCopyWith<$Res> {
  factory _$$_CartDomainCopyWith(
          _$_CartDomain value, $Res Function(_$_CartDomain) then) =
      __$$_CartDomainCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cartId,
      String productId,
      String title,
      String imageUrl,
      double price,
      int quantity});
}

/// @nodoc
class __$$_CartDomainCopyWithImpl<$Res>
    extends _$CartDomainCopyWithImpl<$Res, _$_CartDomain>
    implements _$$_CartDomainCopyWith<$Res> {
  __$$_CartDomainCopyWithImpl(
      _$_CartDomain _value, $Res Function(_$_CartDomain) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? productId = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? quantity = null,
  }) {
    return _then(_$_CartDomain(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartDomain implements _CartDomain {
  const _$_CartDomain(
      {required this.cartId,
      required this.productId,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.quantity});

  factory _$_CartDomain.fromJson(Map<String, dynamic> json) =>
      _$$_CartDomainFromJson(json);

  @override
  final String cartId;
  @override
  final String productId;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final double price;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartDomain(cartId: $cartId, productId: $productId, title: $title, imageUrl: $imageUrl, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartDomain &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, cartId, productId, title, imageUrl, price, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartDomainCopyWith<_$_CartDomain> get copyWith =>
      __$$_CartDomainCopyWithImpl<_$_CartDomain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartDomainToJson(
      this,
    );
  }
}

abstract class _CartDomain implements CartDomain {
  const factory _CartDomain(
      {required final String cartId,
      required final String productId,
      required final String title,
      required final String imageUrl,
      required final double price,
      required final int quantity}) = _$_CartDomain;

  factory _CartDomain.fromJson(Map<String, dynamic> json) =
      _$_CartDomain.fromJson;

  @override
  String get cartId;
  @override
  String get productId;
  @override
  String get title;
  @override
  String get imageUrl;
  @override
  double get price;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_CartDomainCopyWith<_$_CartDomain> get copyWith =>
      throw _privateConstructorUsedError;
}
