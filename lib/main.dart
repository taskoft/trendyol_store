import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendyol_store/blocs/product_bloc/product_bloc.dart';
import 'package:trendyol_store/locator.dart';

import 'pages/main_state.dart';

void main() {
  setupLocator();
  runApp(BlocProvider<ProductListBloc>(
      create: (context) =>
          ProductListBloc(ProductListLoadedState(products: [])),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: MainState());
  }
}
