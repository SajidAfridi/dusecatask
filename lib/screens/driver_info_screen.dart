import 'package:dusecatask/common_widgets/custom_appBar.dart';
import 'package:dusecatask/common_widgets/elevated_button.dart';
import 'package:dusecatask/screens/ride_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/bar_chart/bar_graph.dart';

class DriverInfoScreen extends StatefulWidget {
  const DriverInfoScreen({super.key});

  @override
  State<DriverInfoScreen> createState() => _DriverInfoScreenState();
}

class _DriverInfoScreenState extends State<DriverInfoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64.h,
          ),
          appBar(context, 'Driver info.'),
          SizedBox(
            height: 33.h,
          ),
          Container(
            height: 50.h,
            width: 360.w,
            color: const Color(0xffF54242).withOpacity(0.08),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  labelColor: const Color(0xffE52A24),
                  unselectedLabelColor:
                      const Color(0xffE52A24).withOpacity(0.4),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorColor: const Color(0xffE52A24),
                  padding: EdgeInsets.zero,
                  tabs: const [
                    Tab(
                      text: 'Earnings',
                    ),
                    Tab(
                      text: 'No. Rides',
                    ),
                    Tab(
                      text: 'Billings',
                    ),
                    Tab(
                      text: 'Reviews',
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: SizedBox(
              height: 200.h,
              width: 290.w,
              child: TabBarView(controller: _tabController, children: [
                // TabBarView for earnings, No.rides, billings and reviews.
                earnings(),
                earnings(),
                earnings(),
                earnings(),
              ]),
            ),
          ),
          SizedBox(
            height: 31.h,
          ),
          Center(
            child: SizedBox(
              height: 90.h,
              width: 295.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '200.68.00 zl',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                          height: 40.h,
                          width: 120.w,
                          child: elevatedButton('Withdraw', () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const RideHistoryScreen();
                            }));
                          }))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 0),
                    child: Divider(
                      thickness: 1.h,
                      color: const Color(0xff3E4958).withOpacity(0.17),
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget earnings() {
    return SizedBox(
      height: 198.h,
      width: 296.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your earnings',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffA3AED0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_up,
                          size: 20.sp,
                          color: const Color(0xffEA2523),
                        ),
                        Text(
                          'This week',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffEA2523),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            // a bar chart without the measuring numbers on x and y axis
            SizedBox(
              height: 140.h,
              child: const MyBarChart(
                weeklySummary: [160.4, 100.4, 220.6, 140.4, 200.4, 250.4, 40.4],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
