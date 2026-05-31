import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerListItem extends StatelessWidget {
  final Map<String, dynamic> customer;

  const CustomerListItem({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final bool hasStatus =
        customer['statusText'] != null &&
        customer['statusText'].toString().isNotEmpty;
    final bool isPaid = customer['isPaid'] ?? false;

    // Dynamic Colors
    Color avatarColor;
    switch (customer['avatarText']) {
      case 'আ':
        avatarColor = const Color(0xFFF43F5E);
        break;
      case 'রহ':
        avatarColor = const Color(0xFF10B981);
        break;
      case 'না':
        avatarColor = const Color(0xFFD946EF);
        break;
      case 'সু':
        avatarColor = const Color(0xFF3B82F6);
        break;
      case 'কা':
        avatarColor = const Color(0xFFF59E0B);
        break;
      default:
        avatarColor = const Color(0xFF3B82F6);
    }

    Color statusColor = Colors.transparent;
    final statusText = customer['statusText']?.toString() ?? '';
    if (statusText.contains('ওভারডিউ')) {
      statusColor = const Color(0xFFF43F5E);
    } else if (statusText.contains('বাকি')) {
      statusColor = const Color(0xFFF59E0B);
    } else if (statusText.contains('পরিশোধ')) {
      statusColor = const Color(0xFF10B981);
    }

    Color amountColor = isPaid
        ? const Color(0xFF10B981)
        : const Color(0xFFF43F5E);
    Color amountLabelColor = isPaid
        ? const Color(0xFF10B981)
        : const Color(0xFF64748B);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Avatar ──
          Container(
            height: 48.w,
            width: 48.w,
            decoration: BoxDecoration(
              color: avatarColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                customer['avatarText'],
                style: TextStyle(
                  color: avatarColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 14.w),

          // ── Name & Status ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer['name'],
                  style: TextStyle(
                    color: const Color(0xFF0F172A),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  customer['phone'],
                  style: TextStyle(
                    color: const Color(0xFF64748B),
                    fontSize: 12.sp,
                  ),
                ),
                if (hasStatus) ...[
                  SizedBox(height: 6.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(
                        0.1,
                      ), // Light pill background
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isPaid) ...[
                          Icon(Icons.check, color: statusColor, size: 14.sp),
                          SizedBox(width: 4.w),
                        ],
                        Text(
                          customer['statusText'],
                          style: TextStyle(
                            color: statusColor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),

          // ── Amount ──
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                customer['amount'],
                style: TextStyle(
                  color: amountColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                customer['amountLabel'],
                style: TextStyle(
                  color: amountLabelColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
