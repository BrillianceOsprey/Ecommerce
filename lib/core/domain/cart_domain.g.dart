// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartDomain _$$_CartDomainFromJson(Map<String, dynamic> json) =>
    _$_CartDomain(
      cartId: json['cartId'] as String,
      productId: json['productId'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$_CartDomainToJson(_$_CartDomain instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'productId': instance.productId,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'quantity': instance.quantity,
    };
