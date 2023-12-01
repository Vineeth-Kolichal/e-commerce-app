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

  Future<void> pay({
    required int amountInPaisa,
    required Function(PaymentSuccessResponse response) successResp,
    required Function(PaymentFailureResponse response) failiureResp,
  }) async {
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

    try {
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, successResp);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, failiureResp);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletCallback);
      razorpay.open(options);
    } catch (e) {
      log(e.toString());
    }
  }

  void externalWalletCallback(ExternalWalletResponse response) {
    log(response.toString());
  }
}
