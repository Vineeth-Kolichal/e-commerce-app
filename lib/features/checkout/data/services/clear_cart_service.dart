import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_machine_test_jurysoft/common/controllers/firestore_provider.dart';
import 'package:ecommerce_machine_test_jurysoft/features/cart/data/model/cart_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clearCartServiceProvider = Provider<ClearCart>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return ClearCart(firestore);
});

class ClearCart {
  final FirebaseFirestore firestore;

  ClearCart(this.firestore);

  Future<void> clearCartItems(List<CartItemModel> cartItems) async {
    final colRef = firestore.collection('cart');
    for (var x in cartItems) {
      await colRef.doc(x.id).delete();
    }
  }
}
