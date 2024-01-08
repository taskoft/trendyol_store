import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendyol_store/blocs/cart_bloc/cart_bloc.dart';
import 'package:trendyol_store/pages/detail_page.dart';
import '../models/product.dart';

class CartsPage extends StatefulWidget {
  const CartsPage({super.key});

  @override
  State<CartsPage> createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    //final productBloc = BlocProvider.of<ProductListBloc>(context);
    List<Product> allProducts = [];
    debugPrint("CARTS BUILD");
    return BlocBuilder(
      bloc: cartBloc,
      builder: ((context, state) {
        if (state is CartInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartLoadedState) {
          allProducts = state.product;
          return GridView.builder(
              itemCount: allProducts.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400, mainAxisExtent: 160),
              itemBuilder: (context, count) {
                return _cartsWidget(allProducts[count], (id) {
                  state.product.removeWhere((element) => element.id == id);
                  setState(() {});
                });
              });
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.red,
        ));
      }),
    );
  }

  Widget _cartsWidget(Product pr, void Function(int) removeFunction) {
    final void Function(int) detailFunction = removeFunction;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      //color: Colors.white,
      margin: const EdgeInsets.all(1),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Image.network(pr.image.toString(),
                  height: 110,
                  alignment: Alignment.topLeft,
                  fit: BoxFit.contain),
            ),
          ),
          Positioned(
            left: 110,
            right: 10,
            top: 15,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(product: pr)),
                );
              },
              child: Text(
                pr.title.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    fontFamily: 'Dance'),
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
          ),
          const Positioned(
            left: 120,
            right: 212,
            top: 120,
            child: Divider(
              color: Colors.black,
              height: 4,
              thickness: 2,
            ),
          ),
          Positioned(
            left: 121,
            right: 15,
            bottom: 15,
            top: 70,
            child: Text(
              pr.category.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  color: Colors.black45),
              textAlign: TextAlign.start,
            ),
          ),
          const Positioned(
            left: 121,
            right: 15,
            bottom: 15,
            top: 50,
            child: Text(
              'Wallet with chain',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54),
              textAlign: TextAlign.start,
            ),
          ),
          Positioned(
            left: 10,
            right: 100,
            top: 60,
            bottom: 1,
            child: TextButton(
              onPressed: () {
                detailFunction(pr.id!);
              },
              child: const Text(
                'REMOVE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
