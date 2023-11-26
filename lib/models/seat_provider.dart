import 'dart:math';

import '../constants/seat_status.dart';
import 'package:flutter/material.dart';

class SeatProvider with ChangeNotifier {
  List<SeatStatus> seats = [];

  void initializeSeats(int numberOfSeats) {
    seats = List.generate(numberOfSeats, (index) => _getRandomSeatStatus());
  }

  selectSeat(int seatIndex) {
    if (seats[seatIndex] == SeatStatus.available) {
      seats[seatIndex] = SeatStatus.selected;
      notifyListeners();
    }
  }
  SeatStatus _getRandomSeatStatus() {
    // Implement logic to randomly assign seat status based on your requirements
    // For example, you can use math.random() to generate random indices for seat types.
    // Update this method as per your specific needs.
    // This is just a sample, and you might need to adjust it.
    final random = Random().nextInt(3); // Assuming 3 seat types
    switch (random) {
      case 0:
        return SeatStatus.available;
      case 1:
        return SeatStatus.unavailable;
      case 2:
        return SeatStatus.selected;
      default:
        return SeatStatus.available;
    }
  }

}