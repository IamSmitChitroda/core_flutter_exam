import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffDBE7C9),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Cart page",
          style: TextStyle(color: Color(0xffDBE7C9)),
        ),
        backgroundColor: const Color(0xff294B29),
      ),
      // body: ,
      backgroundColor: const Color(0xff50623A),
    );
  }
}
