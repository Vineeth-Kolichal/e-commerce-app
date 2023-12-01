import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

final razorServiceProvider = Provider<RazorpayServices>((ref) {
  return RazorpayServices(Razorpay());
});

class RazorpayServices {
  final Razorpay razorpay;
  static const String apiKey = 'rzp_test_iB6csD8z6wRUYu';
  RazorpayServices(this.razorpay);

  void successPayment() {
    //razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, successCallback);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, errorCallback);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletCallback);
  }

  Future<void> pay(int amountInPaisa) async {
    Map<String, dynamic> options = {
      'key': apiKey,
      'amount': amountInPaisa,
      'currency': 'INR',
      'name': 'e-Shopping',
      'description': "description",
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9562492664', 'email': 'vinee.kcl@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    //String orderPlacedDate = DateTime.now().toString();
    // orderModel = OrderModell(
    //   cartlist: cartList,
    //   paymentId: paymentId,
    //   discription: description,
    //   address: address,
    //   israzorpay: true,
    //   userid: userId,
    //   totalPrice: totalPrice,
    //   orderStatus: 'order plced',
    //   orderPlacedDate: orderPlacedDate,
    // );

    try {
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, errorCallback);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletCallback);
      razorpay.open(options);
    } catch (e) {
      log(e.toString());
    }
  }

  //Payment is success
  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log(response.orderId.toString());
  }

  void errorCallback(PaymentFailureResponse response) {
    log(response.toString());
  }

  void externalWalletCallback(ExternalWalletResponse response) {
    log(response.toString());
  }
}