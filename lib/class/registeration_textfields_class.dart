import 'package:flutter/cupertino.dart';

class RegisterFields {
  String textFieldName;
  String hintText;
  String label;
  TextEditingController controller;

  RegisterFields({
    required this.textFieldName,
    required this.hintText,
    required this.label,
    required this.controller,
  });
}
