import 'package:ecommerce_machine_test_jurysoft/features/home_page/data/models/product_list_model.dart';
import 'package:ecommerce_machine_test_jurysoft/features/home_page/data/services/home_page_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeDataProvider = FutureProvider<List<Product>>((ref) async {
  final service = ref.watch(homeServiceProvider);
  final data = await service.getAllProducts();
  return data;
});
