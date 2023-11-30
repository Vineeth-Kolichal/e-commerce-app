import 'package:ecommerce_machine_test_jurysoft/common/widgets/main_button.dart';
import 'package:ecommerce_machine_test_jurysoft/common/widgets/space.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.separated(
          itemBuilder: (ctx, index) {
            return CartItem();
          },
          separatorBuilder: (ctx, index) {
            return Space.y(7);
          },
          itemCount: 10,
        )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: AppTheme.whiteColor,
          height: 60,
          child: Row(
            children: [
              Expanded(
                  child: Center(
                child: Text(
                  "₹670000",
                  style: txt19BlackB,
                ),
              )),
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
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedNotifier = ValueNotifier(1);
    var items = [1, 2, 3, 4, 5];
    return Container(
      padding: EdgeInsets.all(10),
      color: AppTheme.whiteColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: 80,
            color: Colors.amber,
            child: Image.network(
              "https://rukminim1.flixcart.com/image/850/1000/xif0q/mobile/1/d/y/-original-imaghxcpvtta2hzs.jpeg?q=90",
              fit: BoxFit.cover,
            ),
          ),
          Space.x(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Iphone',
                  style: txt15BlackSB,
                ),
                Space.y(5),
                RatingBar.builder(
                  itemSize: 15,
                  initialRating: 3.6,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.green,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Space.y(5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: 30,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppTheme.greyColor, width: 0.1)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Qty: ',
                        style: txt12Black,
                      ),
                      ValueListenableBuilder(
                          valueListenable: selectedNotifier,
                          builder: (context, selected, _) {
                            return DropdownButton(
                              style: txt12Black,
                              underline: SizedBox.shrink(),
                              // Initial Value
                              value: selected,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((int items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text("$items"),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (int? newValue) {
                                selectedNotifier.value = newValue!;
                                // setState(() {
                                //   dropdownvalue = newValue!;
                                // });
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
                      "₹670000",
                      style: txt17BlackB,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5, color: AppTheme.greyColor)),
                        child: Row(
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
