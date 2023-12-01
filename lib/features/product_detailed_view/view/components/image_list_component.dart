import 'package:ecommerce_machine_test_jurysoft/common/widgets/space.dart';
import 'package:ecommerce_machine_test_jurysoft/features/home_page/data/models/product_list_model.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ImageListComponent extends StatelessWidget {
  const ImageListComponent({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> imageNotifier = ValueNotifier(0);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            ValueListenableBuilder(
              valueListenable: imageNotifier,
              builder: (context, index, _) {
                return SizedBox(
                  height: size.width,
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
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: product.images.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ValueListenableBuilder(
                  valueListenable: imageNotifier,
                  builder: (context, selected, _) {
                    return InkWell(
                      onTap: () {
                        imageNotifier.value = index;
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: (selected == index)
                                ? Border.all(width: 2, color: Colors.blue)
                                : Border.all(width: 1, color: Colors.grey)),
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
            itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
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
    );
  }
}
