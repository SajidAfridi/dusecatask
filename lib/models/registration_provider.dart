import 'package:dusecatask/class/registeration_textfields_class.dart';
import 'package:dusecatask/constants/register_fields_hints_labels.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isPasswordValidated = false;
  bool isPassenger = true;
  bool isDriver = false;

  set setIsPasswordValidated(bool value) {
    isPasswordValidated = value;
    notifyListeners();
  }

  set setIsPasswordVisible(bool value) {
    isPasswordVisible = value;
    notifyListeners();
  }

  set setIsConfirmPasswordVisible(bool value) {
    isConfirmPasswordVisible = value;
    notifyListeners();
  }

  List<RegisterFields> get listRegisterFields => listOfRegistrationFields();

  //dynamic textfield generator function
  List<RegisterFields> listOfRegistrationFields() {
    List<RegisterFields> fields = [];
    for (int i = 0; i < registerFieldName.length; i++) {
      fields.add(
        RegisterFields(
          textFieldName: registerFieldName[i],
          hintText: registerHints[i],
          label: registerLabels[i],
          controller: TextEditingController(),
        ),
      );
    }
    return fields;
  }

  bool isEmailValidated = false;

  void driver() {
    isDriver = !isDriver;
    isPassenger = !isPassenger;
    notifyListeners();
  }

  void passenger() {
    isPassenger = !isPassenger;
    isDriver = !isDriver;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
  }

  //handling the case if the password is validated or not, include uppercase, lowercase and one special character
  void passwordValidation(String password) {
    if (password.length >= 8) {
      if (password.contains(RegExp(r'[A-Z]'))) {
        if (password.contains(RegExp(r'[a-z]'))) {
          if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
            isPasswordValidated = true;
          } else {
            isPasswordValidated = false;
          }
        } else {
          isPasswordValidated = false;
        }
      } else {
        isPasswordValidated = false;
      }
    } else {
      isPasswordValidated = false;
    }
  }
}
