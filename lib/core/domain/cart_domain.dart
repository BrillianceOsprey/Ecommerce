import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_domain.freezed.dart';
part 'cart_domain.g.dart';

@freezed
class CartDomain with _$CartDomain {
  const factory CartDomain({
    required String cartId,
    required String productId,
    required String title,
    required String imageUrl,
    required double price,
    required int quantity,
  }) = _CartDomain;
  factory CartDomain.fromJson(Map<String, dynamic> json) =>
      _$CartDomainFromJson(json);
}
