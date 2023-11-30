import 'package:ecommerce_machine_test_jurysoft/features/cart/data/model/cart_item_model.dart';
import 'package:ecommerce_machine_test_jurysoft/features/cart/data/services/cart_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartPageProvider =
    StateNotifierProvider<CartController, CartState>((ref) {
  final services = ref.watch(cartServiceProvider);
  return CartController(services);
});

class CartController extends StateNotifier<CartState> {
  final CartServices cartServices;
  CartController(this.cartServices) : super(CartLoading()) {
    getCartItems();
  }
  Future<void> getCartItems() async {
    final data = await cartServices.getAllCartItems();
    state = CartData(data: data);
  }

  Future<void> changeQty(int qty, String docId) async {
    await cartServices.qtyChange(qty, docId).then((value) {
      getCartItems();
    });
  }

  Future<void> delete(String docId) async {
    await cartServices.removeFromCart(docId).then((value) {
      getCartItems();
    });
  }
}

abstract class CartState {}

class CartLoading extends CartState {}

class CartData extends CartState {
  final List<CartItemModel> data;

  CartData({required this.data});
}
