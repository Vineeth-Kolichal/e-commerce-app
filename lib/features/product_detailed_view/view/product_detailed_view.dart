import 'package:ecommerce_machine_test_jurysoft/common/widgets/main_button.dart';
import 'package:ecommerce_machine_test_jurysoft/common/widgets/space.dart';
import 'package:ecommerce_machine_test_jurysoft/features/checkout/view/screen/checkout_screen.dart';
import 'package:ecommerce_machine_test_jurysoft/features/product_detailed_view/controller/add_to_cart_controller.dart';
import 'package:ecommerce_machine_test_jurysoft/features/product_detailed_view/controller/cart_check_controller.dart';
import 'package:ecommerce_machine_test_jurysoft/features/product_detailed_view/controller/image_view_controller.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home_page/data/models/product_list_model.dart';

class ProductDetailedView extends ConsumerWidget {
  const ProductDetailedView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    ref.read(isExistProvider.notifier).isExist(product.docId);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(children: [
                  Consumer(
                    builder: (context, ref, _) {
                      int index = ref.watch(imageViewProvider);
                      return SizedBox(
                        // height: size.width,
                        width: size.width,
                        child: Image.network(
                          product.images[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  )
                ]),
                Space.y(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: product.images.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Consumer(
                              builder: (context, ref, _) {
                                int selected = ref.watch(imageViewProvider);
                                return InkWell(
                                  onTap: () {
                                    ref.read(imageViewProvider.notifier).state =
                                        index;
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: (selected == index)
                                            ? Border.all(
                                                width: 2, color: Colors.blue)
                                            : Border.all(
                                                width: 1, color: Colors.grey)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        product.images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Space.x(5);
                          },
                        ),
                      ),
                      Space.y(10),
                      Text(
                        product.lTitile,
                        style: txt19BlackB,
                      ),
                      RatingBar.builder(
                        ignoreGestures: true,
                        itemSize: 20,
                        initialRating: 3.6,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Space.y(10),
                      Row(
                        children: [
                          Space.x(5),
                          Text(
                            '₹${product.price}',
                            style: txt17BlackB,
                          )
                        ],
                      ),
                      Text(product.discription),
                      Space.y(10),
                    ],
                  ),
                ),
                const Text('  Other Details'),
                Column(
                  children: List.generate(
                      product.otherDetails.length,
                      (index) => Container(
                            color: index % 2 != 0
                                ? AppTheme.lightGreyColor1
                                : AppTheme.scaffoldBg,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      product.otherDetails[index].title,
                                      style: txt12GreySM,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Text(product.otherDetails[index].value),
                                  ),
                                ),
                              ],
                            ),
                          )),
                )
              ],
            ),
          ),
          Consumer(
            builder: (ctx, ref, _) {
              final isExist = ref.watch(isExistProvider);
              return SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainButton(
                      label: isExist ? "Added to cart" : "Add to cart",
                      buttonColor: const Color.fromRGBO(255, 255, 255, 1),
                      onPressed: () {
                        if (!isExist) {
                          ref
                              .read(addToCartProvider)
                              .addToCart(product.docId)
                              .then((value) {
                            ref
                                .read(isExistProvider.notifier)
                                .isExist(product.docId);
                          });
                        }
                      },
                    ),
                    MainButton(
                      label: "Buy now",
                      buttonColor: AppTheme.yellowColor,
                      onPressed: () async {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (ctx) => CheckoutScreen()));
                        // final data = [
                        //   {
                        //     "pId": 1,
                        //     "sTitile": "IPhone 14",
                        //     "lTitile": "IPhone 11 236 GB Black",
                        //     "discription":
                        //         "With its sleek design, powerful processor, and stunning display, the iPhone is the perfect way to shop online.",
                        //     "rating": 4.5,
                        //     "price": 68444.50,
                        //     "images": [
                        //       "https://rukminim1.flixcart.com/image/850/1000/xif0q/mobile/1/d/y/-original-imaghxcpvtta2hzs.jpeg?q=90",
                        //       "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1694674022/Croma%20Assets/Communication/Mobiles/Images/300819_0_aunzde.png?tr=w-600"
                        //     ],
                        //     "otherDetails": [
                        //       {"title": "RAM", "value": "12 GB"},
                        //       {"title": "Storage", "value": "256 GB"},
                        //       {"title": "Color", "value": "Black"}
                        //     ]
                        //   },
                        //   {
                        //     "pId": 2,
                        //     "sTitile": "Motorola G84",
                        //     "lTitile": "Motorola G84 Red, 12GB 128 GB",
                        //     "discription": "This is a I Phone",
                        //     "rating": 4.6,
                        //     "price": 189999.50,
                        //     "images": [
                        //       "https://www.clove.co.uk/cdn/shop/files/MotoG845GMarshmallowBlue_2048x.jpg?v=1695140482",
                        //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT_OZQpP-YYpoKQxuBvgqW4qaPleWARQGV82Ov3QNibHBRulBkK5jt_Pc-xobzKGmYAXo&usqp=CAU"
                        //     ],
                        //     "otherDetails": [
                        //       {"title": "RAM", "value": "12 GB"},
                        //       {"title": "Storage", "value": "256 GB"},
                        //       {"title": "Color", "value": "Red"}
                        //     ]
                        //   }
                        // ];

                        // final collection =
                        //     FirebaseFirestore.instance.collection('Products');
                        // for (var x in data) {
                        //   await collection.add(x);
                        // }
                      },
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
