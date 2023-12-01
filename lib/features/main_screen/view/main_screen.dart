import 'package:ecommerce_machine_test_jurysoft/common/controllers/firestore_provider.dart';
import 'package:ecommerce_machine_test_jurysoft/features/cart/view/cart_page.dart';
import 'package:ecommerce_machine_test_jurysoft/features/home_page/view/screen/home_screen.dart';
import 'package:ecommerce_machine_test_jurysoft/features/main_screen/controller/bottom_nav_controller.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(bottomNavProvider);
    List<String> titles = ["e-ShoppingCart", "Whishlist", "Cart", "Profile"];
    List<Widget> pages = const [
      HomeScreen(),
      WishlistPage(),
      CartPage(),
      ProfilePage()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[index]),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_active),
          )
        ],
        bottom: index == 0
            ? const PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: CupertinoSearchTextField(),
                ))
            : null,
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Iconsax.home),
          ),
          const BottomNavigationBarItem(
            label: "Wishlist",
            icon: Icon(Iconsax.heart),
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 30,
              width: 35,
              child: StreamBuilder(
                  stream: ref
                      .watch(firestoreProvider)
                      .collection('cart')
                      .snapshots(),
                  builder: (context, snapshot) {
                    int length = 0;
                    length = snapshot.data?.docs.length ?? 0;
                    return Stack(
                      children: [
                        const Icon(Iconsax.shopping_cart),
                        Visibility(
                          visible: length != 0,
                          child: Positioned(
                            top: 0,
                            right: 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppTheme.redColor,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Text(
                                    "$length",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: AppTheme.whiteColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            label: "Cart",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: "Profile",
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: index,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        iconSize: 25,
        onTap: (index) {
          ref.read(bottomNavProvider.notifier).state = index;
        },
        elevation: 5,
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WishlistPage extends StatelessWidget {
  const WishlistPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Whishlist is empty',
      ),
    );
  }
}
