import 'package:flutter/cupertino.dart';

import '../class/ride_history_class.dart';

class RideHistoryProvider extends ChangeNotifier {
  List<RideHistory> rideHistory = [
    RideHistory(
      startLocation: 'Gorzow',
      endLocation: 'Berlin Airport',
      price: 45.99,
      country: 'Germany',
    ),
    RideHistory(
      startLocation: 'Gorzow',
      endLocation: 'Berlin Airport',
      price: 45.99,
      country: 'Germany',
    ),
    RideHistory(
      startLocation: 'Gorzow',
      endLocation: 'Berlin Airport',
      price: 45.99,
      country: 'Germany',
    ),
  ];
}
