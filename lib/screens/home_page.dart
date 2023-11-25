import 'package:dusecatask/screens/ride_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// Seat Provider
class SeatProvider with ChangeNotifier {
  List<SeatStatus> seats = [
    SeatStatus.available,
    SeatStatus.available,
    SeatStatus.unavailable,
    SeatStatus.available,
    SeatStatus.available,
    SeatStatus.unavailable,
  ];

  void initializeSeats(int numberOfSeats) {
    // Initialize seats based on the number of seats in the car
    seats = List.generate(numberOfSeats, (index) => SeatStatus.available);
  }

  selectSeat(int seatIndex) {
    if (seats[seatIndex] == SeatStatus.available) {
      seats[seatIndex] = SeatStatus.selected;
      notifyListeners();
    }
  }

// Add more methods as needed for your use case, e.g., unselectSeat, bookSeat, etc.
}

enum SeatStatus {
  available,
  unavailable,
  selected,
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final seatProvider = Provider.of<SeatProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            const Text('Book Seat'),
            SizedBox(height: 16.h),
            Container(
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
            ),
            SizedBox(height: 41.h),
            SizedBox(
              child: Image.asset('assets/images/car_body.png'),
            ),
            SizedBox(height: 16.h), // Adjust spacing as needed
            // Use a GridView to display seats dynamically
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 seats in each row
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                ),
                itemCount: seatProvider.seats.length,
                itemBuilder: (context, index) {
                  SeatStatus seatStatus = seatProvider.seats[index];
                  Widget seatWidget = _getSeatWidget(seatStatus, index);

                  return GestureDetector(
                    onTap: () {
                      if (seatStatus == SeatStatus.available) {
                        seatProvider.selectSeat(index);
                        _showSelectedSeatsDialog(context,
                            seatProvider.selectSeat(seatProvider.seats.length));
                      }
                    },
                    child: seatWidget,
                  );
                },
              ),
            ),
            // ElevatedButton
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50.h,
                width: 296.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const RideHistoryScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffE92928),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Select Seat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 1.5,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
