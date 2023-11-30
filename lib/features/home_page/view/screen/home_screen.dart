import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_machine_test_jurysoft/features/product_detailed_view/view/product_detailed_view.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CarouselSlider(
                items: [
                  BannerSlideItem(
                    bgColor: const Color.fromARGB(255, 2, 66, 95),
                  ),
                  BannerSlideItem(
                    bgColor: const Color.fromARGB(255, 7, 99, 175),
                  ),
                  BannerSlideItem(
                    bgColor: const Color.fromARGB(255, 49, 125, 224),
                  ),
                ],
                options: CarouselOptions(
                  autoPlayInterval: Duration(seconds: 5),
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                  viewportFraction: 1,
                ),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ProductGridItem();
              },
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              childAspectRatio: 0.63,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => ProductDetailedView()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          border: Border.all(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 224, 224, 224),
              blurRadius: 3,
              spreadRadius: 0.5,
              offset: Offset(0.0, 4.0), // shadow direction: bottom right
            ),
          ],
        ),
        alignment: Alignment.center,
        //color: ,
        child: Column(
          children: [
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://rukminim1.flixcart.com/image/850/1000/xif0q/mobile/1/d/y/-original-imaghxcpvtta2hzs.jpeg?q=90',
                fit: BoxFit.cover,
              ),
            )),
            LayoutBuilder(builder: (context, constraints) {
              print("${constraints.maxWidth}");
              return Container(
                padding: EdgeInsets.all(6),
                width: constraints.maxWidth,
                height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Iphone",
                      style: txt15BlackSB,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Apple I phone 14 (Blue, 124)',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: txt12GreySB,
                    ),
                    Text(
                      "₹670000",
                      style: txt17BlackB,
                    ),
                    RatingBar.builder(
                      itemSize: 15,
                      initialRating: 2.3,
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
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class BannerSlideItem extends StatelessWidget {
  const BannerSlideItem({
    super.key,
    required this.bgColor,
  });

  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.95,
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}