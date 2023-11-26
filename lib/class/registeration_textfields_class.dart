import 'package:flutter/cupertino.dart';

class RegisterFields {
  String textFieldName;
  String hintText;
  String label;
  TextEditingController controller;
  bool isEmailValid;
  bool isPasswordValid;

  RegisterFields({
    required this.textFieldName,
    required this.hintText,
    required this.label,
    required this.controller,
    this.isEmailValid = false, // Set default values to true
    this.isPasswordValid = false,
  });
}
