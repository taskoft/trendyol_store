import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:trendyol_store/blocs/product_bloc/product_bloc.dart";
import "package:trendyol_store/models/product.dart";
import "package:trendyol_store/widgets/card.dart";

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  bool dataFetched = false;
  bool dataFetcfhed = false;

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductListBloc>(context);
    if (!dataFetched) {
      productBloc.add(FetchProductsEvent());
      dataFetched = true;
    }
    return BlocBuilder(
      bloc: productBloc,
      builder: (context, state) {
        if (state is ProductListLoadedState) {
          final List<Product> products = state.products;
          if (products.isEmpty) {
            return const Text("Products is null");
          }
          return GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 270, mainAxisExtent: 250),
            itemBuilder: (BuildContext context, int count) {
              return CardWidget(
                productImagePath: products[count].image.toString(),
                productName: products[count].title.toString(),
                productId: products[count].id!,
                productIsChecked: products[count].isChecked!,
                addFavoriteId: (int id, bool isChecked) {
                  products[id].isChecked;
                },
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        
      },
    );
  }
}
