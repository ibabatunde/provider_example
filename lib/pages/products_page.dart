import 'package:flutter/material.dart';
import 'package:my_app/consts.dart';
import 'package:my_app/providers/cart_providers.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Products",
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/carts");
          },
          icon: const Icon(
            Icons.shopping_cart,
          ),
        )
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return ListView.builder(
      itemCount: PRODUCTS.length,
      itemBuilder: (context, index) {
        Product product = PRODUCTS[index];
        return ListTile(
          leading: Container(
            height: 25,
            width: 25,
            color: product.color,
          ),
          title: Text(product.name),
          trailing: Checkbox(
            value: cartProvider.items.contains(product),
            onChanged: (value) {
              value == true
                  ? cartProvider.add(product)
                  : cartProvider.remove(product);
            },
          ),
        );
      },
    );
  }
}
