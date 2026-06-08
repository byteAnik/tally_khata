import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottedAmount extends StatelessWidget {
  const DottedAmount({
    super.key,
    required this.isGivingDue,
    required TextEditingController amountController,
  }) : _amountController = amountController;

  final bool isGivingDue;
  final TextEditingController _amountController;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        color: isGivingDue
            ? const Color(0xFFEF4444)
            : const Color(0xFF10B981),
        strokeWidth: 1.5,
        dashPattern: const [8, 4],
        radius: Radius.circular(16.r),
        padding: EdgeInsets.zero,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 24.h),
        decoration: BoxDecoration(
          color: isGivingDue
              ? const Color(0xFFEF4444).withOpacity(0.05)
              : const Color(0xFF10B981).withOpacity(0.05),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Text(
              'পরিমাণ লিখুন',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF64748B),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '৳ ',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: isGivingDue
                        ? const Color(0xFFEF4444)
                        : const Color(0xFF10B981),
                  ),
                ),
                IntrinsicWidth(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w800,
                      color: isGivingDue
                          ? const Color(0xFFEF4444)
                          : const Color(0xFF10B981),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: '0',
                      hintStyle: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w800,
                        color: (isGivingDue
                                ? const Color(0xFFEF4444)
                                : const Color(0xFF10B981))
                            .withOpacity(0.5),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}