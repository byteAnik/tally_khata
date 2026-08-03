import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class TransactionHistorySection extends StatelessWidget {
  const TransactionHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactions = [
      {
        "title": "বাকি যোগ হয়েছে",
        "subtitle": "চাল ৫ কেজি • আজ ১০:০০ AM",
        "amount": "-৳৬৫০",
        "isDue": true,
      },
      {
        "title": "পেমেন্ট পাওয়া গেছে",
        "subtitle": "নগদ • গতকাল ৪:১৫ PM",
        "amount": "+৳১,০০০",
        "isDue": false,
      },
      {
        "title": "বাকি যোগ হয়েছে",
        "subtitle": "ডাল ২ কেজি • ১০ মে",
        "amount": "-৳৪৫০",
        "isDue": true,
      },
      {
        "title": "পেমেন্ট পাওয়া গেছে",
        "subtitle": "বিকাশ • ৮ মে",
        "amount": "+৳২,০০০",
        "isDue": false,
      },
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'লেনদেনের ইতিহাস',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0F172A),
              ),
            ),
            Text(
              'ফিল্টার',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF10B981),
              ),
            ),
          ],
        ),
        UIHelper.verticalSpace(16.h),

        // Transaction Cards List
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          separatorBuilder: (context, index) => UIHelper.verticalSpace(12.h),
          itemBuilder: (context, index) {
            final tx = transactions[index];
            final isDue = tx['isDue'] as bool;
            return Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFE2E8F0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Indicator Dot
                  Container(
                    height: 8.w,
                    width: 8.w,
                    decoration: BoxDecoration(
                      color: isDue
                          ? const Color(0xFFEF4444)
                          : const Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                  ),
                  UIHelper.horizontalSpace(14.w),
                  // Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx['title'],
                          style: TextStyle(
                            color: const Color(0xFF0F172A),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        UIHelper.verticalSpace(4.h),
                        Text(
                          tx['subtitle'],
                          style: TextStyle(
                            color: const Color(0xFF64748B),
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Amount
                  Text(
                    tx['amount'],
                    style: TextStyle(
                      color: isDue
                          ? const Color(0xFFEF4444)
                          : const Color(0xFF10B981),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
