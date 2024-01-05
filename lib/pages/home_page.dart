import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:trendyol_store/blocs/product_bloc/product_bloc.dart";
import "package:trendyol_store/models/product.dart";
import "package:trendyol_store/widgets/card.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductListBloc>(context);
    debugPrint("HOMEPAGE BUILD");
    return BlocBuilder(
      bloc: productBloc,
      builder: (context, state) {
        if (state is ProductListInitialState) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.teal));
        }
        if (state is ProductListLoadedState) {
          final List<Product> products = state.products;

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
                  /*products[id].isChecked = isChecked;*/
                  state.products[id-1].isChecked = isChecked;
                  debugPrint("CALLBACK $id ");
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
