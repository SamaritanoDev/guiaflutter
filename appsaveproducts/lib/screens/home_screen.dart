import 'package:appsaveproducts/screens/loading_screen.dart';
import 'package:appsaveproducts/services/products_service.dart';
import 'package:appsaveproducts/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    if (productsService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            productsService.selectedProduct =
                productsService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(
            product: productsService.products[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
