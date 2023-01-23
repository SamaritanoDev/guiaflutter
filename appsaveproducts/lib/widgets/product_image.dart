import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;
  const ProductImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        width: double.infinity,
        height: 450,
        decoration: _buildBoxDecoration(),
        child: Opacity(
          opacity: 0.8,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: url == null
                ? const Image(
                    image: AssetImage('assets/no-image.png'), fit: BoxFit.cover)
                : FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/load.gif'),
                    image: NetworkImage(url!),
                  ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.black,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45), topRight: Radius.circular(45)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          spreadRadius: 5,
          blurRadius: 10,
          offset: const Offset(0, 5), // changes position of shadow
        ),
      ],
    );
  }
}
