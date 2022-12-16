import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if (productService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              authService.logOut();
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            child: ProductCard(
              product: productService.products[index],
            ),
            onTap: () {
              productService.selectProduct =
                  productService.products[index].copy();
              Navigator.pushNamed(context, ProductScreen.routeName);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productService.selectProduct = Product(
            available: false,
            name: '',
            price: 0.0,
          );
          Navigator.pushNamed(context, ProductScreen.routeName);
        },
      ),
    );
  }
}
