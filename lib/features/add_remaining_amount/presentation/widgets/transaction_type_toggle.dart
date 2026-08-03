import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/controllers/add_remaining_amount_controller.dart';

class TransactionTypeToggle extends StatelessWidget {
  const TransactionTypeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddRemainingAmountController>();

    return Obx(() {
      final isGivingDue = controller.isGivingDue.value;
      return Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.toggleTransactionType(true),
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: isGivingDue
                    ? const Color(0xFF10B981)
                    : Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: isGivingDue
                      ? const Color(0xFF10B981)
                      : const Color(0xFFE2E8F0),
                ),
              ),
              child: Center(
                child: Text(
                  'বাকি দিন',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: isGivingDue
                        ? Colors.white
                        : const Color(0xFF64748B),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: GestureDetector(
             onTap: () => controller.toggleTransactionType(false),
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: !isGivingDue
                    ? const Color(0xFF10B981)
                    : Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: !isGivingDue
                      ? const Color(0xFF10B981)
                      : const Color(0xFFE2E8F0),
                ),
              ),
              child: Center(
                child: Text(
                  'পেমেন্ট নিন',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: !isGivingDue
                        ? Colors.white
                        : const Color(0xFF64748B),
                  ),
                ),
              ),
            ),
          ),
          ),
        ],
      );
    });
  }
}
