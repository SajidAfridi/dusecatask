import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appBar(BuildContext context, String title) {
  return Padding(
    padding: EdgeInsets.only(left: 30.w),
    child: SizedBox(
      height: 36.h,
      width: 214.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //circular icon button with red color and some shadow
          Container(
            height: 36.h,
            width: 36.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0.5,
                  blurRadius: 5,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 4.0.w),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    ),
  );
}