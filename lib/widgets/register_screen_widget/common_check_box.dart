import 'package:dusecatask/models/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Widget registerCheckBoxWithText() {
  return Row(
    children: [
      passwordCheckBox(),
      SizedBox(
        width: 10.w,
      ),
      Text(
        'Password should be at least 8 characters long, '
        'uppercase,\nlowercase and unique code',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 9.sp,
        ),
        textAlign: TextAlign.left,
      ),
    ],
  );
}

Widget passwordCheckBox() {
  return Consumer<RegisterProvider>(
    builder: (BuildContext context, RegisterProvider value, Widget? child) {
      return Container(
        height: 18.h,
        width: 18.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: value.isPasswordValidated ? Colors.green : Colors.black,
            width: value.isPasswordValidated ? 9.w : 2.w,
          ),
        ),
        child: value.isPasswordValidated
            ? Checkbox(
                value: value.isPasswordValidated,
                checkColor: Colors.white,
                activeColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                onChanged: (value) {},
              )
            : null,
      );
    },
  );
}

Widget redCircleCheckBox(VoidCallback onPressed1, bool value1) {
  return GestureDetector(
    onTap: onPressed1,
    child: Container(
      height: 18.h,
      width: 18.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: value1 ? Colors.red : Colors.black,
          width: value1 ? 5 : 2.w,
        ),
      ),
    ),
  );
}
