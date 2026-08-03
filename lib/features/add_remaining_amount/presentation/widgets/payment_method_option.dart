import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/constants/app_assets/assets_icons.dart';

class PaymentMethodOption extends StatefulWidget {
  const PaymentMethodOption({super.key});

  @override
  State<PaymentMethodOption> createState() => _PaymentMethodOptionState();
}

class _PaymentMethodOptionState extends State<PaymentMethodOption> {
  int selectedPaymentMethodIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildPaymentMethodOption(
          index: 0,
          icon: AssetsIcons.nagadIcon,
          label: 'নগদ',
        ),
        SizedBox(width: 12.w),
        _buildPaymentMethodOption(
          index: 1,
          icon: AssetsIcons.bKashIcon,
          label: 'বিকাশ',
        ),
        SizedBox(width: 12.w),
        _buildPaymentMethodOption(
          index: 2,
          icon: AssetsIcons.cardIcon,
          label: 'কার্ড',
        ),
      ],
    );
  }

  Widget _buildPaymentMethodOption({
    required int index,
    required String icon,
    required String label,
  }) {
    final isSelected = selectedPaymentMethodIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedPaymentMethodIndex = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF10B981).withOpacity(0.05)
                : Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF10B981)
                  : const Color(0xFFE2E8F0),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                icon,
                height: 35.sp,
                width: 35.sp,
              ),
              SizedBox(height: 8.h),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? const Color(0xFF10B981)
                      : const Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
