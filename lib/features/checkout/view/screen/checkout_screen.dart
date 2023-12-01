import 'package:ecommerce_machine_test_jurysoft/common/widgets/main_button.dart';
import 'package:ecommerce_machine_test_jurysoft/features/cart/data/model/cart_item_model.dart';
import 'package:ecommerce_machine_test_jurysoft/features/checkout/controller/payment_method_controller.dart';
import 'package:ecommerce_machine_test_jurysoft/features/checkout/data/services/razorpay_services.dart';
import 'package:ecommerce_machine_test_jurysoft/features/checkout/view/screen/succes_screen.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/export_components.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen(
      {super.key, required this.cartItemModelList, required this.total});
  final double total;
  final List<CartItemModel> cartItemModelList;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<int> stepNotifier = ValueNotifier(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: stepNotifier,
                builder: (context, step, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StepRow(step: step),
                      if (step == 0) const SelectAddress(),
                      if (step == 1)
                        CheckoutItems(
                          cartItemModelList: cartItemModelList,
                        ),
                      if (step == 2) const PaymentMethods()
                    ],
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: AppTheme.whiteColor,
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "₹$total",
                      style: txt19BlackB,
                    ),
                  ),
                ),
                MainButton(
                    widthFactor: 0.5,
                    label: "Continue",
                    buttonColor: AppTheme.yellowColor,
                    onPressed: () {
                      if (stepNotifier.value == 0) {
                        stepNotifier.value = 1;
                      } else if (stepNotifier.value == 1) {
                        stepNotifier.value = 2;
                      } else {
                        int paymentType = ref.watch(paymentMethodProvider);
                        if (paymentType == 0) {
                        } else {
                          final totalAmout = (total * 100).toInt();
                          ref.read(razorServiceProvider).pay(
                              amountInPaisa: totalAmout,
                              successResp: (resp) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => const SuccessScreen()));
                              },
                              failiureResp: (resp) {});
                        }
                      }
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
