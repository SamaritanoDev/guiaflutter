import 'dart:convert';

import 'package:flutter/Material.dart';
import '../models/product.dart';

import 'package:http/http.dart' as http;

import 'dart:developer';

class ProductsService extends ChangeNotifier {
  final String _baseurl =
      'https://apps-en-flutter-fh-default-rtdb.firebaseio.com/';
  final List<Product> products = [];
  late Product selectedProduct;

  bool isLoading = true;
  bool isSaving = false;

  ProductsService() {
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      final url = Uri.parse('$_baseurl' 'products.json');
      final resp = await http.get(url);

      final Map<String, dynamic> producstMap = json.decode(resp.body);

      producstMap.forEach((key, value) {
        final tempProduct = Product.fromMap(value);
        tempProduct.id = key;
        products.add(tempProduct);
      });

      isLoading = false;
      notifyListeners();
    } catch (e, st) {
      log('$e');
      log('error: $st');
    }
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      //es necesario crear
    } else {
      //actualizar
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseurl, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());
    final decodeData = resp.body;
    print(decodeData);

    //TODO: Actualizar ña ñista de productos
    return '';
  }
}
