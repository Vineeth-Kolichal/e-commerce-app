import 'package:ecommerce_machine_test_jurysoft/features/home_page/view/screen/home_screen.dart';
import 'package:ecommerce_machine_test_jurysoft/features/main_screen/view/main_screen.dart';
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E- Commerce application',
      theme: AppTheme.theme,
      home: MainScreen(),
    );
  }
}
