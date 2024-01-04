import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:trendyol_store/blocs/product_bloc/product_bloc.dart";
import "package:trendyol_store/models/product.dart";
import "package:trendyol_store/widgets/card.dart";

// ignore: must_be_immutable
class FavoritesPage extends StatefulWidget {
  List<int> favoritesIdList;
  FavoritesPage({super.key, required this.favoritesIdList});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final bool isChecked = false;
  late List<int> favoritesIdList;
  bool here = false;
  @override
  void initState() {
    favoritesIdList = widget.favoritesIdList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 2;

    final productBloc = BlocProvider.of<ProductListBloc>(context);
    // productBloc.add(FetchProductsEvent());
    List<Product> favoritedProductList = <Product>[];
    return BlocBuilder(
      bloc: productBloc,
      builder: (context, state) {
        if (state is ProductListLoadedState && currentIndex == 2) {
          final List<Product> products = state.products;
          for (var f in favoritesIdList) {
            favoritedProductList += (products.where(
              (element) => f == element.id,
            )).toList();
          }

          if (products.isEmpty) {
            return const Text("Products is null");
          }
          return GridView.builder(
              itemCount: favoritedProductList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 270, mainAxisExtent: 250),
              itemBuilder: (BuildContext context, int count) {
                return CardWidget(
                  productImagePath:
                      favoritedProductList[count].image.toString(),
                  productName: favoritedProductList[count].title.toString(),
                  productId: favoritedProductList[count].id!,
                  addFavoriteId: (int id, bool isChecked) {},
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
