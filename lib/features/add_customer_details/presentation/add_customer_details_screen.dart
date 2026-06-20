import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tally_khata/constants/app_assets/assets_image.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class AddCustomerDetailsScreen extends StatelessWidget {
  const AddCustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dummyTransactions = [
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

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Top Header Section (Green Container) ──────────────────────────
            Container(
              width: double.infinity,
              color: const Color(0xFF10B981),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16.h,
                left: 20.w,
                right: 20.w,
                bottom: 24.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Bar Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.cFFFFFF.withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.cFFFFFF.withOpacity(0.1),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.cFFFFFF,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Text(
                        'গ্রাহকের বিবরণ',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color:AppColors.cFFFFFF,
                        ),
                      ),
                      // Edit Button
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: Icon(
                          Icons.edit_note,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(24.h),

                  // Profile Info Row
                  Row(
                    children: [
                      // Circle Avatar
                      ClipOval(
                        child: Image.asset(
                          AssetsImages.anik,
                          width: 72.w,
                          height: 72.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: 72.w,
                                height: 72.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white24,
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 32.sp,
                                ),
                              ),
                        ),
                      ),
                      UIHelper.horizontalSpace(16.w),

                      // Customer Metadata
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'রহিম মিয়া',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            UIHelper.verticalSpace(6.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone_outlined,
                                  color: Colors.white.withOpacity(0.85),
                                  size: 14.sp,
                                ),
                                UIHelper.horizontalSpace(4.w),
                                Text(
                                  '+880 1712 345 678',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.85),
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(4.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white.withOpacity(0.85),
                                  size: 14.sp,
                                ),
                                UIHelper.horizontalSpace(4.w),
                                Text(
                                  'মিরপুর ১০, ঢাকা',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.85),
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(24.h),

                  // Balance Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.white.withOpacity(0.08)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'মোট বকেয়া',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 13.sp,
                              ),
                            ),
                            UIHelper.verticalSpace(6.h),
                            Text(
                              '৳ ৩,৪৫০',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'শেষ লেনদেন',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 11.sp,
                              ),
                            ),
                            UIHelper.verticalSpace(4.h),
                            Text(
                              'আজ ১০:০০ AM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            UIHelper.verticalSpace(8.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFEF3C7),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                '৩ দিন বাকি',
                                style: TextStyle(
                                  color: const Color(0xFFB45309),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Bottom Section (Light Content) ────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  // Action Buttons Row
                  Row(
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
                  ),
                  UIHelper.verticalSpace(28.h),

                  // Transaction History Header
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
                    itemCount: dummyTransactions.length,
                    separatorBuilder: (context, index) =>
                        UIHelper.verticalSpace(12.h),
                    itemBuilder: (context, index) {
                      final tx = dummyTransactions[index];
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
