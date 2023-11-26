import 'package:dusecatask/widgets/common_check_box.dart';
import 'package:dusecatask/screens/home_page.dart';
import 'package:dusecatask/widgets/registeration_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../models/registration_provider.dart';
import '../../widgets/register_check_boxes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 90.h),
              Container(
                height: 33.h,
                width: 124.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: const Color(0xffE92928),
                    width: 1.5.w,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Duseca',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffE92928),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 43.h),
              Text(
                'SignUp today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                'Provider us your credentials to start\njourney with us',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22.h,
              ),
              SizedBox(
                height: 351.h,
                width: 296.w,
                child: const RegisterFields(),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 296.w,
                height: 18.h,
                child: const UserRoleCheckBoxes(),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 296.w,
                height: 32.h,
                child: registerCheckBoxWithText(),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 46.h,
                width: 296.w,
                child: ElevatedButton(
                  onPressed: () {
                    var validationValue =Provider.of<RegisterProvider>(context, listen: false).validation();
                    if(validationValue=='Success'){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(validationValue),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffE92928),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Create Account',
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
            ],
          ),
        ),
      ),
    );
  }
}
