import '../constants/seat_status.dart';
import 'package:flutter/material.dart';

class SeatProvider with ChangeNotifier {
  List<SeatStatus> seats = [
    SeatStatus.available,
    SeatStatus.available,
    SeatStatus.unavailable,
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