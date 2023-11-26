import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookSeatStatusRow extends StatelessWidget {
  const BookSeatStatusRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39.h,
      width: 360.w,
      color: const Color(0xfffee6e6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                height: 23.04.h,
                width: 25.w,
                color: Colors.green,
              ),
              SizedBox(
                width: 10.w,
              ),
              const Text('Available')
            ],
          ),
          Row(
            children: [
              Container(
                height: 23.04.h,
                width: 25.w,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10.w,
              ),
              const Text('Unavailable')
            ],
          ),
          Row(
            children: [
              Container(
                height: 23.04.h,
                width: 25.w,
                color: const Color(0xffE52A24),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Text('Selected')
            ],
          ),
        ],
      ),
    );
  }
}
