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
    //var prs  = context.watch<ProductListBloc>().products;
    //debugPrint(prs.length.toString());
    List<Product> products = [];
    debugPrint("BUILD");
    //context.read<ProductListBloc>().add(FetchProductsEvent());
    return BlocBuilder(
      bloc: productBloc,
      builder: (context, state) {
        if (state is ProductListInitialState) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.black));
        }
        if (state is ProductListLoadedState) {
          debugPrint(
              "PRODUCTS HOMEPAGE: ---------------------------${state.products.length}-------------");

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
