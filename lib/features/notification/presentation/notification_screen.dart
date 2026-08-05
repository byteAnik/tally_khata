import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, dynamic>> dummyNotifications = [
    {
      "isAlert": true,
      "message": "আলী সিকদারের ৳5,100 বাকি — 7 দিন",
    },
    {
      "isAlert": false,
      "message": "সুমন আহমেদ ৳1,200 পরিশোধ করেছেন",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF8FAFC, // Matches customer_details_screen.dart
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UIHelper.kDefaulutPadding(),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(20.h),
                Text(
                  "বিজ্ঞপ্তি",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                UIHelper.verticalSpace(24.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: dummyNotifications.length,
                    itemBuilder: (context, index) {
                      final notification = dummyNotifications[index];
                      final bool isAlert = notification['isAlert'];
        
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 22.h,
                        ),
                        decoration: BoxDecoration(
                          color: isAlert
                              ? const Color(0xFFFEF2F2) // Light red background
                              : Colors.white,
                          border: Border(
                            bottom: index < dummyNotifications.length - 1
                                ? const BorderSide(
                                    color: Color(0xFFE2E8F0),
                                    width: 1,
                                  )
                                : BorderSide.none,
                          ),
                        ),
                        child: Row(
                          children: [
                            if (isAlert) ...[
                              Icon(
                                Icons.error_outline,
                                color: const Color(0xFFEF4444),
                                size: 22.sp,
                              ),
                            ] else ...[
                              Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDCFCE7), // Light green
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Icon(
                                  Icons.payments_outlined,
                                  color: const Color(0xFF10B981),
                                  size: 18.sp,
                                ),
                              ),
                            ],
                            SizedBox(width: 14.w),
                            Expanded(
                              child: Text(
                                notification['message'],
                                style: TextStyle(
                                  color: isAlert
                                      ? const Color(0xFFEF4444)
                                      : const Color(0xFF0F172A),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                UIHelper.verticalSpace(80.h), // space for bottom button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
