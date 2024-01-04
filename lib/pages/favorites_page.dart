import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:trendyol_store/blocs/product_bloc/product_bloc.dart";
import "package:trendyol_store/models/product.dart";
import "package:trendyol_store/pages/home_page.dart";
import "package:trendyol_store/widgets/card.dart";
import '../widgets/app_bar.dart';

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
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: const PreferredSize(
          preferredSize: Size(100, 45), child: AppBarWidget()),
      body: BlocBuilder(
        bloc: productBloc,
        builder: (context, state) {
          if (state is ProductListLoadedState && currentIndex==2) {
            final List<Product> products = state.products;
            for (var f in favoritesIdList) {
              favoritedProductList += (products.where(
                (element) =>f == element.id,
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,fixedColor: Colors.red,
        currentIndex: currentIndex,
        onTap: (int newIndex) {
          currentIndex = newIndex;
          if (newIndex == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.male), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }
}
