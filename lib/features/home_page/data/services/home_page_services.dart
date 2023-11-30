import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_machine_test_jurysoft/common/controllers/firestore_provider.dart';
import 'package:ecommerce_machine_test_jurysoft/features/home_page/data/models/product_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeServiceProvider = StateProvider((ref) {
  final firestore = ref.watch(firestoreProvider);
  return HomeService(firestore: firestore);
});

class HomeService {
  final FirebaseFirestore firestore;

  HomeService({required this.firestore});

  Future<List<Product>> getAllProducts() async {
    List<Product> productList = [];
    final data = await firestore.collection('Products').get();
    for (var x in data.docs) {
      final data = x.data();
      data["docId"] = x.id;
      productList.add(Product.fromMap(data));
    }
    return productList;
  }
}
