import 'package:flutter/material.dart';

class ProductFromProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
