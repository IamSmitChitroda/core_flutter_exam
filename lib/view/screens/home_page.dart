import 'package:core_flutter_exam/utills/products_utills.dart';
import 'package:core_flutter_exam/utills/routes_utills.dart';
import 'package:core_flutter_exam/view/componets/all_category.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff294B29),
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Color(0xffDBE7C9)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.cartPage);
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Color(0xffDBE7C9),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: allCategories
                .map((eCategory) => category(
                    eCategory: eCategory, h: h, w: w, context: context))
                .toList(),
          ),
        ),
      ),
      backgroundColor: const Color(0xff50623A),
    );
  }
}
