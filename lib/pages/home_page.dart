import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:trendyol_store/blocs/product_bloc/product_bloc.dart";
import "package:trendyol_store/models/product.dart";
import "package:trendyol_store/pages/favorites_page.dart";
import "package:trendyol_store/widgets/card.dart";
import '../widgets/app_bar.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> _favoriteIdList = [];
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool dataFetched = false;
  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductListBloc>(context);
    if (!dataFetched) {
      productBloc.add(FetchProductsEvent());
      dataFetched = true;
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const PreferredSize(
          preferredSize: Size(100, 45), child: AppBarWidget()),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          BlocBuilder(
            bloc: productBloc,
            builder: (context, state) {
              if (state is ProductListLoadedState && _currentIndex == 0) {
                final List<Product> products = state.products;
                if (products.isEmpty) {
                  return const Text("Products is null");
                }
                return GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 270, mainAxisExtent: 250),
                    itemBuilder: (BuildContext context, int count) {
                      return CardWidget(
                        productImagePath: products[count].image.toString(),
                        productName: products[count].title.toString(),
                        productId: products[count].id!,
                        addFavoriteId: (int id, bool isChecked) {
                          if (isChecked) {
                            _favoriteIdList.add(id);
                          } else {
                            _favoriteIdList.remove(id);
                          }
                        },
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const Text(""),
          FavoritesPage(favoritesIdList: _favoriteIdList),
          const Text(""),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange.shade600,
        backgroundColor: Colors.grey.shade100,
        currentIndex: _currentIndex,
        iconSize: 35,
        onTap: (int newIndex) {
          _currentIndex = newIndex;
          _pageController.animateToPage(newIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);

          /* if (newIndex == 2) {

             Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FavoritesPage(
                          favoritesIdList: _favoriteIdList,
                        )));
          }*/
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: ""),
        ],
      ),
    );
  }
}
