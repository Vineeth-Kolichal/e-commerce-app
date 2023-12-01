
import 'package:ecommerce_machine_test_jurysoft/common/widgets/space.dart';
import 'package:ecommerce_machine_test_jurysoft/features/checkout/controller/payment_method_controller.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethods extends ConsumerWidget {
  const PaymentMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payment = ref.watch(paymentMethodProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Select payment method"),
          Space.y(20),
          InkWell(
            onTap: () {
              ref.read(paymentMethodProvider.notifier).state = 0;
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 30,
                          child: Image.asset('assets/images/cash.png'),
                        ),
                        const Text('Cash on delivery'),
                      ],
                    ),
                    Icon(payment == 0
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off),
                  ],
                ),
              ),
            ),
          ),
          Space.y(10),
          InkWell(
            onTap: () {
              ref.read(paymentMethodProvider.notifier).state = 1;
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 30,
                          child: Image.asset('assets/images/razor.png'),
                        ),
                        Space.x(5),
                        const Text('Razorpay'),
                      ],
                    ),
                    Icon(payment == 1
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
