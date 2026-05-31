import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryItem extends StatelessWidget {
  final String value;
  final String title;
  final Color valueColor;
  final Color titleColor;

  const SummaryItem({
    super.key,
    required this.value,
    required this.title,
    this.valueColor = const Color(0xFF0F172A),
    this.titleColor = const Color(0xFF64748B),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
