import 'package:dusecatask/common_widgets/custom_appBar.dart';
import 'package:dusecatask/models/ride_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RideHistoryScreen extends StatelessWidget {
  const RideHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RideHistoryProvider>(
        builder:
            (BuildContext context, RideHistoryProvider value, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64.h,
              ),
             appBar(context, 'Ride history'),
              SizedBox(
                height: 33.h,
              ),
              SizedBox(
                height: 600.h,
                width: 360.w,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: value.rideHistory.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Center(
                          child: Container(
                            height: 113.h,
                            width: 296.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.white,
                              border: Border.all(color: const Color(0xffD5DEE2),width: 0.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 1,
                                  offset: const Offset(
                                    0,
                                    1,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 9.h,
                                  left: 7.w,
                                  child: Container(
                                    height: 96.h,
                                    width: 54.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color:
                                          const Color(0xff7acac).withOpacity(1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 23.22.h,
                                  left: 64.w,
                                  child: SizedBox(
                                    height: 45.h,
                                    child: Image.asset(
                                      'assets/images/start_to_end.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 9.w,
                                  bottom: 8.h,
                                  child: SizedBox(
                                    width: 85.w,
                                    height: 30.h,
                                    child: Image.asset(
                                      'assets/images/van.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 18.8.h,
                                  left: 84.7.w,
                                  child: Text(
                                    value.rideHistory[index].startLocation,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Color(0xff3E4958),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 38.h,
                                  bottom: 55.h,
                                  right: 20.w,
                                  child: Text(
                                    "\$ ${value.rideHistory[index].price}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xff303535),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 55.19.h,
                                  left: 83.7.w,
                                  child: Text(
                                    value.rideHistory[index].endLocation,
                                    style: TextStyle(
                                      color: const Color(0xff3E4958),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 60.h,
                                  bottom: 36.9,
                                  right: 28.w,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_sharp,
                                        size: 10.sp,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        value.rideHistory[index].country,
                                        style: TextStyle(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
