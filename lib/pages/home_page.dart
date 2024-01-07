import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:trendyol_store/blocs/product_bloc/product_bloc.dart";
import "package:trendyol_store/models/product.dart";
import "package:trendyol_store/widgets/card.dart";

import "detail_page.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductListBloc>(context);
    //productBloc.add(ChangeStatetaEvent());
    debugPrint("BUILD");

    return BlocBuilder(
      bloc: productBloc,
      builder: (context, state) {
        List<Product> products = [];

        debugPrint("BLOCBUILDER");
        if (state is ProductListInitialState) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.teal));
        }
        if (state is ProductListLoadedState) {
          products = state.products;
          return GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 270, mainAxisExtent: 240),
            itemBuilder: (BuildContext context, int count) {
              return CardWidget(
                productImagePath: products[count].image.toString(),
                productName: products[count].title.toString(),
                productId: products[count].id!,
                productIsChecked: products[count].isChecked!,
                detailFunction: (int id) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(product: products[count])));
                },
                addFavoriteId: (int id, bool isChecked) {
                  state.products[count].isChecked = isChecked;
                },
              );
            },
          );
        } else {
          return const Center(child: Text("Something went wrong"));
        }
      },
    );
  }
}
