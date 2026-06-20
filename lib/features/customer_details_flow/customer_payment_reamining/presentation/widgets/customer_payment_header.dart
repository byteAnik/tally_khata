import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CustomerPaymentHeader extends StatelessWidget {
  const CustomerPaymentHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16.sp,
              color: const Color(0xFF0F172A),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          'পেমেন্ট গ্রহণ',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }
}
