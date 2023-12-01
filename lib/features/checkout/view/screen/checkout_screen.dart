import 'package:ecommerce_machine_test_jurysoft/common/widgets/cart_item_widget.dart';
import 'package:ecommerce_machine_test_jurysoft/common/widgets/main_button.dart';
import 'package:ecommerce_machine_test_jurysoft/common/widgets/space.dart';
import 'package:ecommerce_machine_test_jurysoft/features/cart/data/model/cart_item_model.dart';
import 'package:ecommerce_machine_test_jurysoft/features/checkout/controller/payment_method_controller.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class CheckoutItems extends StatelessWidget {
  const CheckoutItems({super.key, required this.cartItemModelList});
  final List<CartItemModel> cartItemModelList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space.y(10),
          const Text("  Order summery"),
          Space.y(10),
          Expanded(
            child: ListView.separated(
              itemBuilder: (ctx, index) {
                return CartItem(
                  isInCheckout: true,
                  cartItemModel: cartItemModelList[index],
                );
              },
              separatorBuilder: (ctx, index) => Space.y(10),
              itemCount: cartItemModelList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class SelectAddress extends StatelessWidget {
  const SelectAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Select delivery Address"),
          Space.y(10),
          Container(
            decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Radio(
                  value: true,
                  groupValue: true,
                  onChanged: (val) {},
                ),
                Space.x(10),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vineeth Chandran",
                        style: txt16Black,
                      ),
                      Space.y(10),
                      Text(
                          'Street:  Plot No 1, Hastsal Road, Vikas Nagar, Delhi, Zip code:  110018, India \nPhone number:  01125633078')
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StepRow extends StatelessWidget {
  const StepRow({super.key, required this.step});
  final int step;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundContainer(isCompleted: step >= 1, stepNum: 1),
          SizedBox(
            width: size.width * 0.2,
            child: const Divider(),
          ),
          RoundContainer(isCompleted: step >= 2, stepNum: 2),
          SizedBox(
            width: size.width * 0.2,
            child: const Divider(),
          ),
          const RoundContainer(
            isCompleted: false,
            stepNum: 3,
          ),
        ],
      ),
    );
  }
}

class RoundContainer extends StatelessWidget {
  const RoundContainer(
      {super.key, required this.isCompleted, required this.stepNum});
  final bool isCompleted;
  final int stepNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCompleted ? AppTheme.whiteColor : AppTheme.blueColor,
          border: Border.all(color: AppTheme.blueColor)),
      child: isCompleted
          ? const Icon(
              Icons.check,
              color: AppTheme.blueColor,
            )
          : Center(
              child: Text(
                "$stepNum",
                style: txt14White,
              ),
            ),
    );
  }
}
