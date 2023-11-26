import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget elevatedButton(String title, onPressed) {
  return SizedBox(
    height: 50.h,
    width: 296.w,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffE92928),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: title== 'Withdraw'?12.sp:16.sp,
          fontWeight: title== 'Withdraw'?FontWeight.w400:FontWeight.w600,
          wordSpacing: 1.5,
          letterSpacing: 1,
        ),
      ),
    ),
  );
}
