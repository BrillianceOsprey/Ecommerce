// import 'dart:convert';

// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:stripe_payment/stripe_payment.dart';

// class StripeTransactionResponse {
//   String message;
//   bool success;
//   StripeTransactionResponse({required this.message, required this.success});
// }

// class StripeService {
//   static String apiBase = 'https://api.stripe.com/v1';
//   static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
//   static Uri paymentApiUri = Uri.parse(paymentApiUrl);
//   static String secret =
//       'sk_test_51KEnW3DbgZc79zEPd0MKjRZykgzNKxhVuvPoDfruwDUIKr4SPslottlRzgwEX8ZDH7ggHZZOb114XRHAnZj0mlmQ00FTzvXNMg';

//   static Map<String, String> headers = {
//     'Authorization': 'Bearer ${StripeService.secret}',
//     'Content-type': 'application/x-www-form-urlencoded'
//   };

//   static init() {
//     StripePayment.setOptions(StripeOptions(
//         publishableKey:
//             'pk_test_51KEnW3DbgZc79zEPmg0mjGgOnFKQoeOObkcJdP2BD9SXJeG3djE8ZOfTpMwL3xssk3UjIzzVZiCULh0ePnqIS5u800D8L4dXMr',
//         merchantId: 'test',
//         androidPayMode: 'test'));
//   }

//   static Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {"amount": amount, "currency": currency};
//       var response =
//           await http.post(paymentApiUri, headers: headers, body: body);
//       return jsonDecode(response.body);
//     } catch (error) {}
//     return null;
//   }

//   static Future<StripeTransactionResponse> payWithNewCard(
//       {required String amount, required String currency}) async {
//     try {
//       var paymentMethod = await StripePayment.paymentRequestWithCardForm(
//           CardFormPaymentRequest());
//       var paymentIntent =
//           await StripeService.createPaymentIntent(amount, currency);
//       var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
//           clientSecret: paymentIntent!['client_secret'],
//           paymentMethodId: paymentMethod.id));
//       if (response.status == 'succeeded') {
//         return StripeTransactionResponse(
//             message: 'Transaction successful', success: true);
//       } else {
//         return StripeTransactionResponse(
//             message: 'Transaction failed', success: false);
//       }
//     } on PlatformException catch (error) {
//       return StripeService.getPlatformExceptionErrorResult(error);
//     } catch (error) {
//       return StripeTransactionResponse(
//           message: 'Transaction failed : $error', success: false);
//     }
//   }

//   static getPlatformExceptionErrorResult(err) {
//     String message = 'Something went wrong';
//     if (err.code == 'cancelled') {
//       message = 'Transaction cancelled';
//     }

//     return StripeTransactionResponse(message: message, success: false);
//   }
// }
