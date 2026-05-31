import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/features/home/presentation/widgets/summary_item.dart';

class BlanceCard extends StatelessWidget {
  const BlanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "মোট বকেয়া বাকি",
                style: TextStyle(
                  color: const Color(0xFF64748B),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  "12 জন",
                  style: TextStyle(
                    color: const Color(0xFF475569),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          Text(
            "৳ 34,250",
            style: TextStyle(
              color: const Color(0xFF0F172A),
              fontSize: 34.sp,
              fontWeight: FontWeight.w800, // Very bold numeric values
            ),
          ),

          SizedBox(height: 20.h),

          // Summary Section (Light Gray Box)
          Container(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: SummaryItem(value: '৳2,800', title: 'আজকে সংগ্রহ'),
                ),
                Container(
                  height: 40.h,
                  width: 1,
                  color: const Color(0xFFE2E8F0),
                ),
                const Expanded(
                  child: SummaryItem(value: '48', title: 'গ্রাহক'),
                ),
                Container(
                  height: 40.h,
                  width: 1,
                  color: const Color(0xFFE2E8F0),
                ),
                const Expanded(
                  child: SummaryItem(value: '78%', title: 'সংগ্রহ হার'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
