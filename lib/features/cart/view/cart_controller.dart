import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView(
          children: [],
        )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.amber,
          child: Row(
            children: [Text('60000')],
          ),
        ),
      ],
    );
  }
}
