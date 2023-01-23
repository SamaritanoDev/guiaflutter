import 'package:appsaveproducts/const/mycolors.dart';
import 'package:appsaveproducts/providers/product_form_provider.dart';
import 'package:appsaveproducts/services/products_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _ProductsScreenBody(productService: productService),
    );
  }
}

class _ProductsScreenBody extends StatelessWidget {
  const _ProductsScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ProductImage(
                url: productService.selectedProduct.picture,
              ),
              Positioned(
                top: 60,
                left: 20,
                child: IconButton(
                  onPressed: (() => Navigator.of(context).pop()),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: ColorsMyApp.optionalcolor,
                  ),
                ),
              ),
              Positioned(
                top: 60,
                right: 20,
                child: IconButton(
                  onPressed: () {
                    //TODO: Galery
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: ColorsMyApp.optionalcolor,
                  ),
                ),
              )
            ],
          ),
          const _ProductForm(),
          const SizedBox(
            height: 80,
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Hello World'),
        backgroundColor: ColorsMyApp.primarycolor,
        child: const Icon(
          Icons.save_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: product.name,
                onChanged: ((value) => product.name = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Nombre del producto',
                  labelText: 'Nombre:',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: '${product.price}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  if (double.tryParse(value) == null) {
                    product.price = 0;
                  } else {
                    product.price = double.parse(value);
                  }
                },
                decoration: const InputDecoration(
                  hintText: '\$150',
                  labelText: 'Precio:',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              SwitchListTile.adaptive(
                  title: const Text('Disponible'),
                  activeColor: ColorsMyApp.secondarycolor,
                  value: product.available,
                  onChanged: (value) {}),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: ColorsMyApp.optionalcolor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      );
}
