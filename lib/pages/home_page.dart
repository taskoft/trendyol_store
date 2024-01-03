import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:trendyol_store/blocs/product_bloc/product_bloc.dart";
import "package:trendyol_store/models/product.dart";
import "package:trendyol_store/widgets/card.dart";
import '../widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //final Map<int,bool> isCheckedasId=<int,bool>{};
  final bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductListBloc>(context);
    productBloc.add(FetchProductsEvent());
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const PreferredSize(
          preferredSize: Size(100, 45), child: AppBarWidget()),
      body: BlocBuilder(
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
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
