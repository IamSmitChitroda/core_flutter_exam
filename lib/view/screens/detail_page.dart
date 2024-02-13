import 'package:flutter/material.dart';

import '../../utills/products_utills.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;

    Map<String, dynamic> data = (ModalRoute.of(context)?.settings.arguments ??
        allProducts[0]) as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Color(0xffDBE7C9),
            )),
        title: Text(
          data['title'],
          style: const TextStyle(color: Color(0xffDBE7C9)),
        ),
        backgroundColor: const Color(0xff294B29),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //ThumbNailView
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  data['images'].length,
                  (index) => Container(
                    height: size.height * 0.3,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(data['images'][index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: const EdgeInsets.all(
                      10,
                    ),
                  ),
                ),
              ),
            ),
            //DetailsCard
            Container(
              // height: double.infinity,
              height: size.height * 0.70,
              width: size.width,
              decoration: const BoxDecoration(
                color: Color(0xff789461),
                // boxShadow: [
                //   BoxShadow(
                //     spreadRadius: 2,
                //     blurRadius: 5,
                //     offset: Offset(0, -2),
                //     color: Colors.grey,
                //   ),
                // ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Text(
                    data['title'],
                    style: const TextStyle(
                      color: Color(0xffDBE7C9),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //description
                  Text(
                    data['description'],
                    style: const TextStyle(
                      color: Color(0xffDBE7C9),
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  //Price
                  Text(
                    "Only \$${(data['price'] - (data['price'] * (data['discountPercentage'] / 100))).toString().split('.')[0]}",
                    style: const TextStyle(
                        color: Color(0xffDBE7C9),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      const Text("       "),
                      Text(
                        "MRP. \$${data['price'].toString()}   ",
                        style: const TextStyle(
                          color: Color(0xffDBE7C9),
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  //Stoke
                  Text(
                    "Avivble in stock ${data['stock']}",
                    style:
                        const TextStyle(color: Color(0xffDBE7C9), fontSize: 17),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xff50623A),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (!cart.contains(data)) {
            cart.add(data);
          }
        },
        icon: const Icon(Icons.shopping_cart),
        label: const Text("Add To Cart"),
      ),
    );
  }
}
