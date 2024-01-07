import 'package:flutter/material.dart';
import 'package:trendyol_store/models/product.dart';
import 'package:trendyol_store/widgets/app_bar.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(130, 45),
        child: AppBarWidget(),
      ),
      body: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.network(
                  product.image!,
                  height: 250,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                // color: Colors.red,
                width: 170,
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          fontFamily: 'Dance'),
                      textAlign: TextAlign.start,
                      maxLines: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          "${product.rating!.rate}   ",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              fontFamily: 'Dance',
                              color: Colors.black),
                        ),
                        const Icon(
                          Icons.star,
                          size: 20,
                        ),
                        Text(
                          "    (${product.rating!.count}) ",
                          style: const TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 20,
                              fontFamily: 'Dance',
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    Text(
                      "\$ ${product.price!}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                        fontFamily: 'Dance',
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ADD TO CART',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                        Divider(
                          endIndent: 61,
                          color: Colors.black,
                          height: 4,
                          thickness: 2,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              //color: Colors.blueAccent,
              height: 500,
              width: 380,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                      fontFamily: 'Dance',
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const Divider(
                    endIndent: 290,
                    color: Colors.black,
                    height: 4,
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    (product.description!).toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 22,
                        fontFamily: 'Dance',
                        color: Colors.black54),
                    maxLines: 12,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
