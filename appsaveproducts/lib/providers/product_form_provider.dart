import 'package:appsaveproducts/models/models.dart';
import 'package:flutter/material.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Product product;

  ProductFormProvider(this.product);

  

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
