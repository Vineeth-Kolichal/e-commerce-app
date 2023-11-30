import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_machine_test_jurysoft/common/controllers/firestore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailedViewProvider = Provider<DetailedViewServices>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return DetailedViewServices(firestore);
});

class DetailedViewServices {
  final FirebaseFirestore firestore;

  DetailedViewServices(this.firestore);

  Future<dynamic> addToCart(String productId) async {
    try {
      final cart = firestore.collection('cart');
      await cart.add({"productId": productId, "qty": 1});
    } catch (e) {}
  }

  Future<bool> checkDocExists(String docId) async {
    bool isExist = false;
    final qSnap = await firestore.collection('cart').get();
    final docs = qSnap.docs;
    for (var x in docs) {
      final data = x.data();
      if (data["productId"] == docId) {
        isExist = true;
      }
    }
    return isExist;
  }
}
