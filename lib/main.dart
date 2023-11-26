import 'package:dusecatask/models/registration_provider.dart';
import 'package:dusecatask/models/ride_history_provider.dart';
import 'package:dusecatask/screens/auth_screens/registration_screen.dart';
import 'package:dusecatask/screens/driver_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'models/seat_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => RegisterProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => RideHistoryProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => SeatProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Duseca Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const DriverInfoScreen(),
        ),
      ),
    );
  }
}
