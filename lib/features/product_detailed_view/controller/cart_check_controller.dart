import 'package:ecommerce_machine_test_jurysoft/features/product_detailed_view/data/services/detailed_view_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isExistProvider = StateNotifierProvider<IsExistCheck, bool>((ref) {
  final services = ref.watch(detailedViewProvider);
  return IsExistCheck(services);
});

class IsExistCheck extends StateNotifier<bool> {
  final DetailedViewServices services;
  IsExistCheck(this.services) : super(false);
  void isExist(String productId) async {
    state = await services.checkDocExists(productId);
  }
}
