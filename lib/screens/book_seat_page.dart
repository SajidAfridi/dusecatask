import 'package:dusecatask/common_widgets/elevated_button.dart';
import 'package:dusecatask/screens/driver_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/book_seats_screen_widgets/seat_status.dart';
import '../models/seat_provider.dart';
import '../widgets/book_seats_screen_widgets/book_seat_status_row.dart';

class BookSeatsScreen extends StatelessWidget {
  const BookSeatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final seatProvider = Provider.of<SeatProvider>(context);
    // Specify the number of seats required
    const numberOfSeats = 15;
    seatProvider.initializeSeats(numberOfSeats);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
      ),
    );
  }

  Stack buildStack(SeatProvider seatProvider) {
    final numberOfSeats = seatProvider.seats.length;
    //each row contain 3 seats so we need to find out the number of rows
    final numberOfRows = (numberOfSeats / 3).ceil();
    final carBodyHeight = 100.0 + (numberOfRows * 64.0);
    return Stack(
      children: [
        SizedBox(
          width: 150.w,
          height: carBodyHeight.h,
          child: Image.asset(
            'assets/images/car_body.png',
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 16.h),
        //the following are the interior of the car
        // which i have commented out for now
        // Positioned(
        //   top: 160.h,
        //   right: 22,
        //   child: Image.asset('assets/images/long_rec.png'),
        // ),
        // Positioned(
        //   top: 163.h,
        //   right: 70,
        //   child: Image.asset('assets/images/short_rec.png'),
        // ),
        // Using a GridView to display seats dynamically
        Positioned(
          top: 60 + (numberOfRows * 20).h,
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
                    seatProvider.selectSeat(index, context);
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
      width: 35.w,
    );
  }
}
