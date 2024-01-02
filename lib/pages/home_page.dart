import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:trendyol_store/blocs/product_bloc/product_bloc.dart";
import "package:trendyol_store/models/product.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductListBloc>(context);
    productBloc.add(FetchProductsEvent());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          centerTitle: true,
          title: const Image(
            image: AssetImage("assets/icons/trendyol_logo_2.png"),
            fit: BoxFit.contain,
            height: 55,
            alignment: Alignment.center,
          ),
        ),
      ),
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
                  return Container(
                    color: Colors.blueGrey.shade50,
                    margin: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          child:
                              Image.network(products[count].image.toString()),
                        ),
                        Positioned(
                          left: 10,
                          right: 10,
                          top: 160,
                          child: Text(
                            products[count].title.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                fontFamily: 'Dance'),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ),
                        const Positioned(
                          left: 20,
                          right: 20,
                          top: 200,
                          child: Text(
                            'SHOP NOW  ',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Positioned(
                            left: 40,
                            right: 40,
                            top: 180,
                            child: Divider(
                              color: Colors.black,
                            )),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                fill: 1,
                                color: Colors.black54,
                              ),
                              onPressed: () {},
                            )),
                      ],
                    ),
                  );
                });
          } else {
            return const Text("There is no data");
          }
        },
      ),
    );
  }
}
