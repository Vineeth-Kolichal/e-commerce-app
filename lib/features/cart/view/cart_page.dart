import 'package:ecommerce_machine_test_jurysoft/common/widgets/main_button.dart';
import 'package:ecommerce_machine_test_jurysoft/common/widgets/space.dart';
import 'package:ecommerce_machine_test_jurysoft/features/cart/controller/cart_controller.dart';
import 'package:ecommerce_machine_test_jurysoft/features/cart/data/model/cart_item_model.dart';
import 'package:ecommerce_machine_test_jurysoft/features/checkout/view/screen/checkout_screen.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Consumer(
          builder: (context, ref, _) {
            final state = ref.watch(cartPageProvider);
            if (state is CartData) {
              final data = state.data;
              if (data.isEmpty) {
                return const Center(
                  child: Text("Cart is empty"),
                );
              } else {
                return ListView.separated(
                  itemBuilder: (ctx, index) {
                    return CartItem(
                      cartItemModel: data[index],
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return Space.y(7);
                  },
                  itemCount: data.length,
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: AppTheme.whiteColor,
          height: 60,
          child: Consumer(builder: (context, ref, _) {
            final state = ref.watch(cartPageProvider);
            double sum = 0.0;
            if (state is CartData) {
              for (var x in state.data) {
                sum = sum + ((x.product.price) * x.qty);
              }
            }

            return Row(
              children: [
                Expanded(
                    child: (state is CartData)
                        ? Center(
                            child: Text(
                              "₹$sum",
                              style: txt19BlackB,
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ))),
                MainButton(
                    widthFactor: 0.5,
                    label: "Place order",
                    buttonColor: AppTheme.yellowColor,
                    onPressed: () {
                      if (state is CartData) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => CheckoutScreen(
                                  cartItemModelList: state.data,
                                  total: sum,
                                )));
                      }
                    })
              ],
            );
          }),
        ),
      ],
    );
  }
}
