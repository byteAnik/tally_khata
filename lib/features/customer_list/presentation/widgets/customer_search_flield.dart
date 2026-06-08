import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerSearchFlield extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const CustomerSearchFlield({
    super.key,
    this.onChanged,
    this.controller,
  });

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
        controller: controller,
        onChanged: onChanged,
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
