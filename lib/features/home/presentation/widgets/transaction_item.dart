import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionItem extends StatelessWidget {
  final String name;
  final String date;
  final String amount;
  final String type;

  const TransactionItem({
    super.key,
    required this.name,
    required this.date,
    required this.amount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final isReceived = type == 'received';
    
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: isReceived 
                  ? const Color(0xFF10B981).withOpacity(0.1)
                  : const Color(0xFFF43F5E).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                isReceived ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                color: isReceived ? const Color(0xFF10B981) : const Color(0xFFF43F5E),
                size: 24.sp,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: isReceived ? const Color(0xFF10B981) : const Color(0xFFF43F5E),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                isReceived ? "জমা" : "বাকি",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: isReceived ? const Color(0xFF10B981) : const Color(0xFFF43F5E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
