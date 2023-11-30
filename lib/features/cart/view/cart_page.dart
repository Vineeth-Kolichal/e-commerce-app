import 'package:ecommerce_machine_test_jurysoft/common/widgets/main_button.dart';
import 'package:ecommerce_machine_test_jurysoft/common/widgets/space.dart';
import 'package:ecommerce_machine_test_jurysoft/features/cart/controller/cart_controller.dart';
import 'package:ecommerce_machine_test_jurysoft/features/cart/data/model/cart_item_model.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

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
          child: Row(
            children: [
              Expanded(child: Consumer(builder: (context, ref, _) {
                final state = ref.watch(cartPageProvider);
                if (state is CartData) {
                  double sum = 0.0;
                  for (var x in state.data) {
                    sum = sum + ((x.product.price) * x.qty);
                  }
                  return Center(
                    child: Text(
                      "₹$sum",
                      style: txt19BlackB,
                    ),
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ));
                }
              })),
              MainButton(
                  widthFactor: 0.5,
                  label: "Place order",
                  buttonColor: AppTheme.yellowColor,
                  onPressed: () {})
            ],
          ),
        ),
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedNotifier = ValueNotifier(cartItemModel.qty);
    var items = [1, 2, 3, 4, 5];
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppTheme.whiteColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: 80,
            color: Colors.amber,
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
                                selectedNotifier.value = newValue!;
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
                    InkWell(
                      onTap: () {},
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
