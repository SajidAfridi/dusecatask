import 'package:dusecatask/widgets/common_check_box.dart';
import 'package:dusecatask/models/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CheckBoxes extends StatelessWidget {
  const CheckBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder:
          (BuildContext context, RegisterProvider register, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            redCircleCheckBox(() {
              register.passenger();
            }, register.isPassenger),
            SizedBox(
              width: 10.w,
            ),
            const Text('Passenger'),
            SizedBox(
              width: 20.w,
            ),
            redCircleCheckBox(() {
              register.driver();

            }, register.isDriver),
            SizedBox(
              width: 10.w,
            ),
            const Text('Driver'),
          ],
        );
      },
    );
  }
}
