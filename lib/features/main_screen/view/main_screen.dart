import 'package:ecommerce_machine_test_jurysoft/features/cart/view/cart_page.dart';
import 'package:ecommerce_machine_test_jurysoft/features/home_page/view/screen/home_screen.dart';
import 'package:ecommerce_machine_test_jurysoft/features/main_screen/controller/bottom_nav_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(bottomNavProvider);
    List<Widget> pages = [HomeScreen(), Container(), CartPage(), Container()];
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: CupertinoSearchTextField(),
            )),
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Iconsax.home),
          ),
          BottomNavigationBarItem(
            label: "Wishlist",
            icon: Icon(Iconsax.heart),
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 30,
              width: 35,
              child: Stack(
                children: [
                  Icon(Iconsax.shopping_cart),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            "15",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
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
