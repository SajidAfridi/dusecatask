import 'package:dusecatask/models/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class RegisterFields extends StatelessWidget {
  const RegisterFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (BuildContext context, RegisterProvider value, Widget? child) {
        return Form(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.listRegisterFields.length,
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
                          value.listRegisterFields[index].textFieldName,
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
                      value.listRegisterFields[index].textFieldName ==
                              'Phone no*'
                          ? SizedBox(
                              height: 38.h,
                              width: 296.w,
                              child: IntlPhoneField(
                                disableLengthCheck: true,
                                flagsButtonMargin: EdgeInsets.symmetric(
                                  vertical: 6.h,
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
                                initialCountryCode: 'UK',
                                controller:
                                    value.listRegisterFields[index].controller,
                                dropdownIconPosition: IconPosition.trailing,
                                decoration: InputDecoration(
                                  hintText:
                                      value.listRegisterFields[index].hintText,
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
                                ),
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
        obscureText: value.listRegisterFields[index].textFieldName == 'Password'
            ? !value.isPasswordVisible
            : value.listRegisterFields[index].textFieldName ==
                    'Confirm password'
                ? !value.isConfirmPasswordVisible
                : false,
        controller: value.listRegisterFields[index].controller,
        onChanged: (text) {
          if (value.listRegisterFields[index].textFieldName == 'Password' ||
              value.listRegisterFields[index].textFieldName ==
                  'Confirm password') {
            value.passwordValidation(text);
          }
        },
        decoration: InputDecoration(
          suffixIcon:
              value.listRegisterFields[index].textFieldName == 'Password'
                  ? IconButton(
                      onPressed: () {
                        value.togglePasswordVisibility();
                      },
                      icon: Icon(
                        value.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xffA1A3B0),
                      ),
                    )
                  : value.listRegisterFields[index].textFieldName ==
                          'Confirm password'
                      ? IconButton(
                          onPressed: () {
                            value.toggleConfirmPasswordVisibility();
                          },
                          icon: Icon(
                            value.isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xffA1A3B0),
                          ),
                        )
                      : null,
          hintText: value.listRegisterFields[index].hintText,
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.r),
            borderSide: BorderSide(
              color: const Color(0xffDADADA),
              width: 0.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.r),
            borderSide: BorderSide(
              color: const Color(0xffDADADA),
              width: 2.w,
            ),
          ),
        ),
      ),
    );
  }
}
