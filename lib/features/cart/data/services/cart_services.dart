import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_machine_test_jurysoft/common/controllers/firestore_provider.dart';
import 'package:ecommerce_machine_test_jurysoft/features/cart/data/model/cart_item_model.dart';
import 'package:ecommerce_machine_test_jurysoft/features/home_page/data/models/product_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartServiceProvider = Provider<CartServices>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return CartServices(firestore);
});

class CartServices {
  final FirebaseFirestore firestore;

  CartServices(this.firestore);

  Future<List<CartItemModel>> getAllCartItems() async {
    List<CartItemModel> cartData = [];
    final qSnap = await firestore.collection('cart').get();
    final docs = qSnap.docs;
    for (var qs in docs) {
      final String id = qs.id;
      final int qty = qs.data()['qty'];
      final q = await firestore
          .collection('Products')
          .doc(qs.data()["productId"])
          .get();
      Map<String, dynamic> pData = q.data()!;
      pData["docId"] = qs.data()["productId"];
      Product product = Product.fromMap(pData);
      final cartItem = CartItemModel(id: id, product: product, qty: qty);
      cartData.add(cartItem);
    }
    return cartData;
  }

  Future<void> qtyChange(int qty, String docId) async {
    final doc = firestore.collection('cart').doc(docId);
    await doc.update({"qty": qty});
  }

  Future<void> removeFromCart(String docId) async {
    await firestore.collection('cart').doc(docId).delete();
  }
}
