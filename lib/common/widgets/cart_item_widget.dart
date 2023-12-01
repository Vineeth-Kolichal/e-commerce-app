import 'package:ecommerce_machine_test_jurysoft/features/cart/data/model/cart_item_model.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../features/cart/controller/cart_controller.dart';
import 'space.dart';

class CartItem extends ConsumerWidget {
  const CartItem(
      {super.key, required this.cartItemModel, this.isInCheckout = false});
  final CartItemModel cartItemModel;
  final bool isInCheckout;
  @override
  Widget build(BuildContext context, ref) {
    ValueNotifier<int> selectedNotifier = ValueNotifier(cartItemModel.qty);
    var items = [1, 2, 3, 4, 5];
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppTheme.whiteColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110,
            width: 100,
            child: Image.network(
              cartItemModel.product.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Space.x(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItemModel.product.sTitile,
                  style: txt15BlackSB,
                ),
                Space.y(5),
                RatingBar.builder(
                  itemSize: 15,
                  initialRating: cartItemModel.product.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.green,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                Space.y(5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 30,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppTheme.greyColor, width: 0.1)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Qty: ',
                        style: txt12Black,
                      ),
                      ValueListenableBuilder(
                          valueListenable: selectedNotifier,
                          builder: (context, selected, _) {
                            return DropdownButton(
                              style: txt12Black,
                              underline: const SizedBox.shrink(),
                              value: selected,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 18,
                              ),
                              items: items.map((int items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text("$items"),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                if (!isInCheckout) {
                                  selectedNotifier.value = newValue!;
                                  ref
                                      .read(cartPageProvider.notifier)
                                      .changeQty(newValue, cartItemModel.id);
                                }
                              },
                            );
                          }),
                    ],
                  ),
                ),
                Space.y(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹${cartItemModel.product.price * (cartItemModel.qty)}",
                      style: txt17BlackB,
                    ),
                    Visibility(
                      visible: !isInCheckout,
                      child: InkWell(
                        onTap: () {
                          ref
                              .read(cartPageProvider.notifier)
                              .delete(cartItemModel.id);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5, color: AppTheme.greyColor)),
                          child: const Row(
                            children: [
                              Icon(
                                Iconsax.trash,
                                size: 13,
                                color: AppTheme.greyColor,
                              ),
                              Text(
                                'Remove',
                                style: txt12GreySM,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
