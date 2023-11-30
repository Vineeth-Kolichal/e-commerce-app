import 'package:ecommerce_machine_test_jurysoft/features/home_page/data/models/product_list_model.dart';

class CartItemModel {
  String id;
  int qty;
  Product product;
  CartItemModel({required this.id, required this.product, required this.qty});
}
