import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:trendyol_store/blocs/product_bloc/product_bloc.dart";
import "package:trendyol_store/models/product.dart";
import "package:trendyol_store/pages/detail_page.dart";
import "package:trendyol_store/widgets/card.dart";

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final bool isChecked = false;
  late List<int> favoritesIdList;

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductListBloc>(context);
    List<Product> fProducts = [];
    List<Product> products = [];

    return BlocBuilder(
      bloc: productBloc,
      builder: (context, state) {
      //  products = context.watch<ProductListBloc>().state.products;
      if (state is ProductListLoadedState) {
        products=state.products;
      }
        /* fProducts.add(context
            .watch<ProductListBloc>()
            .state
            .products
            .firstWhere((element) => element.isChecked == true));*/
        for (var p in products) {
          if (p.isChecked!) {
            fProducts.add(p);
          }
        }

       // debugPrint(fProducts.toString());
        return GridView.builder(
          itemCount: fProducts.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 270, mainAxisExtent: 240),
          itemBuilder: (BuildContext context, int count) {
            //debugPrint(count.toString());
          //  debugPrint(fProducts[count].title.toString());

            return CardWidget(
              productImagePath: fProducts[count].image.toString(),
              productName: fProducts[count].title.toString(),
              productId: fProducts[count].id!,
              productIsChecked: fProducts[count].isChecked!,
              detailFunction: (int id) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              product: fProducts[count],
                            )));
              },
              addFavoriteId: (int id, bool isChecked) {
                /* products[id].isChecked = isChecked;*/
                /*state.products[count].isChecked = isChecked;*/
                setState(() {});
              },
            );
          },
        );
      },
    );
  }
}
