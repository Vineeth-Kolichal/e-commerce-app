
import 'package:ecommerce_machine_test_jurysoft/common/widgets/cart_item_widget.dart';
import 'package:ecommerce_machine_test_jurysoft/common/widgets/space.dart';
import 'package:ecommerce_machine_test_jurysoft/features/cart/data/model/cart_item_model.dart';
import 'package:flutter/material.dart';

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
