import 'dart:convert';

import 'package:flutter/Material.dart';
import '../models/product.dart';

import 'package:http/http.dart' as http;

import 'dart:developer';

class ProductsService extends ChangeNotifier {
  final String _baseurl =
      'https://apps-en-flutter-fh-default-rtdb.firebaseio.com/';
  final List<Product> products = [];
  bool isLoading = true;

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
}
