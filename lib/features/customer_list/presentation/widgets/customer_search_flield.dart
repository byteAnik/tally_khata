import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerSearchFlield extends StatelessWidget {
  const CustomerSearchFlield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: TextField(
        style: const TextStyle(color: Color(0xFF0F172A)),
        decoration: InputDecoration(
          hintText: 'নাম বা ফোন নম্বর...',
          hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 14.sp),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF94A3B8)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        ),
      ),
    );
  }
}
