import 'package:ecommerce_machine_test_jurysoft/features/product_detailed_view/data/services/detailed_view_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addToCartProvider = Provider<DetailedViewServices>((ref) {
  final service = ref.watch(detailedViewProvider);
  return service;
});

