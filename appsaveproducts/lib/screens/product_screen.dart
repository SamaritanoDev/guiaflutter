import 'package:appsaveproducts/const/mycolors.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              const ProductImage(),
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
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '\$150',
                  labelText: 'Precio:',
                ),
              ),
              const SizedBox(height: 30),
              SwitchListTile.adaptive(
                  title: const Text('Disponible'),
                  activeColor: ColorsMyApp.secondarycolor,
                  value: true,
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
