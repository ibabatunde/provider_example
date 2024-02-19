import 'package:flutter/material.dart';
import 'package:my_app/pages/cart_page.dart';
import 'package:my_app/pages/products_page.dart';
import 'package:my_app/providers/cart_providers.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) => CartProvider(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      initialRoute: "/products",
      routes: {
        "/products": (context) => const ProductsPage(),
        "/carts": (context) => const CartPage(),
      },
    );
  }
}
