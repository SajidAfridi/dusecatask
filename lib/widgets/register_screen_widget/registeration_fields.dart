import 'package:dusecatask/models/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({super.key});

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (BuildContext context, RegisterProvider value, Widget? child) {
        return Form(
          key: value.formKey,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.fields.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 14.h),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                        child: Text(
                          value.fields[index].textFieldName,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff303535),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      value.fields[index].textFieldName == 'Phone no*'
                          ? SizedBox(
                              height: 38.h,
                              width: 296.w,
                              child: IntlPhoneField(
                                cursorColor: const Color(0xffA1A3B0),
                                disableLengthCheck: true,
                                keyboardType: TextInputType.number,
                                flagsButtonMargin: EdgeInsets.symmetric(
                                  vertical: 7.h,
                                  horizontal: 8.w,
                                ),
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(
                                    style: BorderStyle.solid,
                                    color: const Color(0xff9B9B9B),
                                    width: 1.w,
                                  ),
                                ),
                                showCountryFlag: false,
                                initialCountryCode: 'PK',
                                controller: value.fields[index].controller,
                                dropdownIconPosition: IconPosition.trailing,
                                decoration: buildInputDecoration(value, index),
                              ),
                            )
                          : buildTextFields(
                              value,
                              index,
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  SizedBox buildTextFields(RegisterProvider value, int index) {
    return SizedBox(
      height: 38.h,
      width: 296.w,
      child: TextFormField(
        cursorRadius: Radius.circular(5.r),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: const Color(0xffA1A3B0),
        obscureText: value.fields[index].textFieldName == 'Password'
            ? !value.isPasswordVisible
            : value.fields[index].textFieldName == 'Confirm password'
                ? !value.isConfirmPasswordVisible
                : false,
        controller: value.fields[index].controller,
        onChanged: (text) {
          if (value.fields[index].textFieldName == 'Your email') {
            value.emailValidation(text);
          } else if (value.fields[index].textFieldName == 'Password') {
            value.passwordValidation(text);
          }
          if (value.fields[index].textFieldName == 'Confirm password') {
            if (value.fields[index - 1].controller.text == text) {
              value.isConfirmPasswordValidated = true;
            } else {
              value.isConfirmPasswordValidated = false;
            }
          }
        },
        decoration: buildInputDecoration(value, index),
      ),
    );
  }

  InputDecoration buildInputDecoration(RegisterProvider value, int index) {
    return InputDecoration(
      hintText: value.fields[index].hintText,
      hintStyle: TextStyle(
        fontSize: 10.sp,
        color: const Color(0xffA1A3B0),
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: BorderSide(
          color: const Color(0xffDADADA),
          width: 2.w,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: BorderSide(
          color: const Color(0xffDADADA),
          width: 2.w,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: BorderSide(
          color: const Color(0xffDADADA),
          width: 2.w,
        ),
      ),
    );
  }

  // create a function to handle the suffix icon of the password, confirm password and email
  suffixIconDecider(RegisterProvider value, int index) {
    if (value.fields[index].textFieldName == 'Your email') {
      return Icon(
        value.isEmailValidated ? Icons.check : null,
        color: const Color(0xffA1A3B0),
      );
    }
    if (value.fields[index].textFieldName == 'Password') {
      return IconButton(
        onPressed: () {
          value.togglePasswordVisibility();
        },
        icon: Icon(
          value.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: const Color(0xffA1A3B0),
        ),
      );
    } else if (value.fields[index].textFieldName == 'Confirm password') {
      return IconButton(
        onPressed: () {
          value.toggleConfirmPasswordVisibility();
        },
        icon: Icon(
          value.isConfirmPasswordVisible
              ? Icons.visibility
              : Icons.visibility_off,
          color: const Color(0xffA1A3B0),
        ),
      );
    } else {
      return null;
    }
  }

  borderColorDecider(RegisterProvider value, int index) {
    if (value.fields[index].textFieldName == 'Your email') {
      return value.isEmailValidated ? Colors.green : Colors.black;
    } else {
      return const Color(0xffDADADA);
    }
  }
}
