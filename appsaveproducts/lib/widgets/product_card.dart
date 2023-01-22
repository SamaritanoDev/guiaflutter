import 'package:appsaveproducts/const/mycolors.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(url: product.picture),
            _ProductDetails(
              title: product.name,
              subTitle: product.id!,
            ),
            Positioned(
                top: 0,
                right: 0,
                child: _PriceTag(
                  price: product.price,
                )),
            if (!product.available)
              const Positioned(top: 0, left: 0, child: _NotAvailable()),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
        color: ColorsMyApp.tertiarycolor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 7),
          ),
        ],
      );
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: const BoxDecoration(
        color: ColorsMyApp.notavailablecolor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('No disponible',
              style: TextStyle(
                color: ColorsMyApp.optionalcolor,
                fontSize: 20,
              )),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double price;

  const _PriceTag({
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 70,
      decoration: const BoxDecoration(
        color: ColorsMyApp.secondarycolor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$$price',
              style: const TextStyle(fontSize: 20, color: Colors.black)),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String title;
  final String subTitle;

  const _ProductDetails({
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: ColorsMyApp.optionalcolor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subTitle,
              style: const TextStyle(
                color: ColorsMyApp.optionalcolor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        color: ColorsMyApp.primarycolor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
      );
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

  const _BackgroundImage({
    Key? key,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: url == null
            ? const Image(image: AssetImage('assets/no-image.png'))
            : FadeInImage(
                placeholder: const AssetImage('assets/load.gif'),
                image: NetworkImage(url!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
