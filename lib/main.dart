import 'package:core_flutter_exam/utills/routes_utills.dart';
import 'package:core_flutter_exam/view/screens/cart_page.dart';
import 'package:core_flutter_exam/view/screens/detail_page.dart';
import 'package:core_flutter_exam/view/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
        MyRoutes.cartPage: (context) => const CartPage(),
      },
    );
  }
}
