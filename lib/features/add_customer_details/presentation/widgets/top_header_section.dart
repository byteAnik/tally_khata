import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tally_khata/constants/app_assets/assets_image.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class TopHeaderSection extends StatelessWidget {
  const TopHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: AppColors.cFFFFFF,
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
    );
  }
}