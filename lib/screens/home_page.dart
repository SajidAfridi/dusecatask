import 'package:dusecatask/common_widgets/elevated_button.dart';
import 'package:dusecatask/screens/driver_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../constants/seat_status.dart';
import '../models/seat_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final seatProvider = Provider.of<SeatProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            const Text('Book Seat'),
            SizedBox(height: 16.h),
            const BookSeatStatusRow(),
            SizedBox(height: 41.h),
            SizedBox(
              height: 500.h,
              //lets build the dynamic part of it
              child: buildStack(seatProvider),
            ),
            SizedBox(
              height: 10.h,
            ),
            elevatedButton(
              'Select Seat',
              () {
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DriverInfoScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 48.h,
            ),
          ],
        ),
      ),
    );
  }



  Stack buildStack(SeatProvider seatProvider) {
    return Stack(
              children: [
                SizedBox(
                  width: 155.w,
                  height: 350.h,
                  child: Image.asset(
                    'assets/images/car_body.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 16.h),
                Positioned(
                  top: 160.h,
                  right: 22,
                  child: Image.asset('assets/images/long_rec.png'),
                ),
                Positioned(
                  top: 163.h,
                  right: 70,
                  child: Image.asset('assets/images/short_rec.png'),
                ),
                // Using a GridView to display seats dynamically
                Positioned(
                  top: 120.h,
                  right: 15,
                  child: SizedBox(
                    height: 400.h,
                    width: 130.w,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 15.h,
                      ),
                      itemCount: seatProvider.seats.length,
                      itemBuilder: (context, index) {
                        SeatStatus seatStatus = seatProvider.seats[index];
                        Widget seatWidget = _getSeatWidget(seatStatus, index);

                        return GestureDetector(
                          onTap: () {
                            if (seatStatus == SeatStatus.available) {
                              seatProvider.selectSeat(index);
                              _showSelectedSeatsDialog(
                                  context,
                                  seatProvider
                                      .selectSeat(seatProvider.seats.length));
                            }
                          },
                          child: seatWidget,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
  }

  Widget _getSeatWidget(SeatStatus seatStatus, int seatIndex) {
    String imagePath;
    switch (seatStatus) {
      case SeatStatus.available:
        imagePath = 'assets/images/available_seat.png';
        break;
      case SeatStatus.unavailable:
        imagePath = 'assets/images/unavailable_seat.png';
        break;
      case SeatStatus.selected:
        imagePath = 'assets/images/selected_seat.png';
        break;
    }
    return Image.asset(
      imagePath,
      height: 40.h,
      width: 40.w,
    );
  }

  void _showSelectedSeatsDialog(BuildContext context, List<int> selectedSeats) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected Seats'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: selectedSeats.map((seatNumber) {
              return Text('Seat $seatNumber');
            }).toList(),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

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
