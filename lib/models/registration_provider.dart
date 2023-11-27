
import 'package:dusecatask/class/registeration_textfields_class.dart';
import 'package:dusecatask/widgets/register_screen_widget/register_fields_hints_labels.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  bool bisPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isPasswordValidated = false;
  bool isPassenger = true;
  bool isConfirmPasswordValidated = false;
  bool isDriver = false;
  List<RegisterFields> fields = [];
  GlobalKey formKey = GlobalKey<FormState>();
  set setIsPasswordValidated(bool value) {
    isPasswordValidated = value;
    notifyListeners();
  }

  set setIsPasswordVisible(bool value) {
    isPasswordVisible = value;
    notifyListeners();
  }


  set setIsConfirmPasswordValidated(bool value) {
    isConfirmPasswordValidated = value;
    notifyListeners();
  }
  // List<RegisterFields> get listRegisterFields => listOfRegistrationFields();

  RegisterProvider(){
    fields = listOfRegistrationFields();
}
  //dynamic textfield generator function
  List<RegisterFields> listOfRegistrationFields() {
    List<RegisterFields> fields = [];
    if (fields.isEmpty) {
      for (int i = 0; i < registerFieldName.length; i++) {
        //add notify listener to the controller
        fields.add(
          RegisterFields(
            isEmailValid: isEmailValidated,
            isPasswordValid: isPasswordValidated,
            textFieldName: registerFieldName[i],
            hintText: registerHints[i],
            label: registerLabels[i],
            controller: TextEditingController(),
          ),
        );
      }
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
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  //handling the case if the password is validated or not, include uppercase, lowercase and one special character
  void passwordValidation(String password) {
// Use a regex or any other validation logic for password
    // Update the isPasswordValid property accordingly
    var regex = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
    isPasswordValidated = regex.hasMatch(password);
    notifyListeners();
  }
  void emailValidation(String email) {
    // Use a regex or any other validation logic for email
    // Update the isEmailValid property accordingly
    var regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    isEmailValidated = regex.hasMatch(email);
    notifyListeners();
  }

  //creating a custom validation for the screen.
  String validation(){
    if(fields[0].controller.text.isEmpty || fields[1].controller.text.isEmpty || fields[2].controller.text.isEmpty || fields[3].controller.text.isEmpty || fields[4].controller.text.isEmpty){
      return 'Please fill all the fields';
    }
    else if(!isEmailValidated){
      return 'Please enter a valid email';
    }else if(!isPasswordValidated){
      return 'Please enter a valid password';
    }else if(!isConfirmPasswordValidated){
      return 'Password does not match';
    }
    else{
      return 'Success';
    }
  }
  // dispose the controllers
  @override
  void dispose() {
    for (int i = 0; i < fields.length; i++) {
      fields[i].controller.dispose();
    }
    super.dispose();
  }
}
