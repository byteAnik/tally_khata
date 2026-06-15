import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFBBF7D0)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.workspace_premium_outlined,
            color: const Color(0xFF16A34A),
            size: 28.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "প্রিমিয়ামে আপগ্রেড করুন",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF16A34A),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "বার্ষিক রিপোর্ট, গ্রাহক-ভিত্তিক বিশ্লেষণ ও আরও বেশি",
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: const Color(0xFF15803D),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: const Color(0xFF16A34A),
          ),
        ],
      ),
    );
  }
}
