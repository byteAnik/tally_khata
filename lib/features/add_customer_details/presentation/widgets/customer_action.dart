import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class CustomerAction extends StatelessWidget {
  const CustomerAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Due button
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFFE2E8F0)),
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            icon: const Icon(
              Icons.add,
              color: Color(0xFF10B981),
              size: 16,
            ),
            label: Text(
              'বাকি দিন',
              style: TextStyle(
                color: const Color(0xFF0F172A),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        UIHelper.horizontalSpace(8.w),
        // Payment button
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFFE2E8F0)),
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            icon: const Icon(
              Icons.account_balance_wallet_outlined,
              color: Color(0xFF10B981),
              size: 16,
            ),
            label: Text(
              'পেমেন্ট',
              style: TextStyle(
                color: const Color(0xFF0F172A),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        UIHelper.horizontalSpace(8.w),
        // Remind button
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFEF3C7),
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
            ),
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Color(0xFFB45309),
              size: 16,
            ),
            label: Text(
              'রিমাইন্ড',
              style: TextStyle(
                color: const Color(0xFFB45309),
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}