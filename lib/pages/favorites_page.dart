import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:trendyol_store/blocs/product_bloc/product_bloc.dart";
import "package:trendyol_store/models/product.dart";
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

    List<Product> products = [];
    List<Product> favoritedProductList = <Product>[];
    return BlocBuilder(
      bloc: productBloc,
      builder: (context, state) {
        products = context.watch<ProductListBloc>().state.products;
        /*favoritedProductList +=
            (products.where((element) => element.isChecked!)).toList();*/
        debugPrint(favoritedProductList.toString());
        debugPrint("Products lengt:  ${products.length}");
        return GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 270, mainAxisExtent: 250),
          itemBuilder: (BuildContext context, int count) {
            if (products[count].isChecked!) {
              return CardWidget(
                productImagePath: products[count].image.toString(),
                productName: products[count].title.toString(),
                productId: products[count].id!,
                productIsChecked: products[count].isChecked!,
                addFavoriteId: (int id, bool isChecked) {
                  /* products[id].isChecked = isChecked;*/
                  setState(() {});
                },
              );
            }else{
              return  Container(color: Colors.amber,width: 50,height: 50,margin:const EdgeInsets.all(10),);
            }
          },
        );
      },
    );
  }
}
