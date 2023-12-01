import 'package:ecommerce_machine_test_jurysoft/common/widgets/main_button.dart';
import 'package:ecommerce_machine_test_jurysoft/features/main_screen/controller/bottom_nav_controller.dart';
import 'package:ecommerce_machine_test_jurysoft/features/main_screen/view/main_screen.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lottie/lottie.dart';

class SuccessScreen extends ConsumerWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.greenColor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HOORAY!!',
              style: TextStyle(
                  fontSize: 27,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w600),
            ),
            LottieBuilder.asset(
              'assets/lottie/success.json',
              height: size.width * 0.5,
            ),
            const Text(
              'Your order has been\n placed successfully',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppTheme.whiteColor, fontSize: 17),
            ),
            const SizedBox(height: 25),
            MainButton(
              label: "Continue Shottping",
              buttonColor: AppTheme.whiteColor,
              onPressed: () {
                ref.read(bottomNavProvider.notifier).state = 0;
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx) => const MainScreen()),
                    (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
