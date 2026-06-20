import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isFilled;

  const CustomerActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 16.w),
      decoration: BoxDecoration(
        color: isFilled ? const Color(0xFFFEF3C7) : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: isFilled ? null : Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 16.sp,
            color: isFilled ? const Color(0xFFD97706) : const Color(0xFF64748B),
          ),
          SizedBox(width: 6.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: isFilled
                  ? const Color(0xFFD97706)
                  : const Color(0xFF475569),
            ),
          ),
        ],
      ),
    );
  }
}
