import 'package:flutter/material.dart';
import 'package:trendyol_store/models/product.dart';
import 'package:trendyol_store/widgets/app_bar.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.all(20),
                child: Image.network(
                  product.image!,
                  height: 250,
                  width: 250,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                // color: Colors.red,
                width: 200,
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
                          "${product.rating!.rate} ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Dance',
                              color: Colors.black),
                        ),
                        const Icon(
                          Icons.star,
                          size: 16,
                        ),
                        Text(
                          "   (${product.rating!.count}) ",
                          style: const TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 18,
                              fontFamily: 'Dance',
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    Text(
                      "\$ ${product.price!}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
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
                          endIndent: 90,
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
          SizedBox(
            height: 600,
            width: 480,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
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
                  endIndent: 380,
                  color: Colors.black,
                  height: 4,
                  thickness: 2,
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
                  maxLines: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
