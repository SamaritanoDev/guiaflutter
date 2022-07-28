import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: const Color(0XFF5A3761))
          : null,
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF5A3761))),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF5A3761), width: 2)),
      hintText: hintText,
    );
  }
}
