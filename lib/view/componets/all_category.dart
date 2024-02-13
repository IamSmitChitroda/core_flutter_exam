import 'package:core_flutter_exam/utills/routes_utills.dart';
import 'package:flutter/material.dart';

import '../../utills/products_utills.dart';

Widget category(
    {required String eCategory,
    required double h,
    required double w,
    required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //TitleOfCategory
      Text(
        eCategory.replaceFirst(eCategory[0], eCategory[0].toUpperCase()),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xffDBE7C9),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...allProducts
                .map(
                  (element) => eCategory == element['category']
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              MyRoutes.detailPage,
                              arguments: element,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            height: h * 0.5,
                            width: w * 0.6,
                            child: Column(
                              children: [
                                //Image
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(3, 3),
                                          blurRadius: 5,
                                          color: Colors.grey,
                                        )
                                      ],
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          element['thumbnail'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                //Detail
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    width: w * 0.6,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff789461),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(3, 3),
                                            blurRadius: 5,
                                            color: Colors.grey)
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          element['title'],
                                          style: const TextStyle(
                                            color: Color(0xffDBE7C9),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          element['description'],
                                          style: const TextStyle(
                                            color: Color(0xffDBE7C9),
                                            fontSize: 16,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              element['price'].toString(),
                                              style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Color(0xffDBE7C9),
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              "  \$ ${(element['price'] - (element['price'] * (element['discountPercentage'] / 100)))}",
                                              style: const TextStyle(
                                                color: Color(0xffDBE7C9),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                )
                .toList(),
          ],
        ),
      ),
    ],
  );
}
