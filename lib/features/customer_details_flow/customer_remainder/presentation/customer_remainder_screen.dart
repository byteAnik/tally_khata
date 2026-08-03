import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tally_khata/common_wigdets/common_textform_flied.dart';
import 'package:tally_khata/constants/app_assets/assets_icons.dart';
import 'package:tally_khata/constants/app_assets/assets_image.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';
import 'package:svg_flutter/svg.dart';

class CustomerRemainderScreen extends StatefulWidget {
  const CustomerRemainderScreen({super.key});

  @override
  State<CustomerRemainderScreen> createState() => _CustomerRemainderScreenState();
}

class _CustomerRemainderScreenState extends State<CustomerRemainderScreen> {
  int _selectedMedium = 0; // 0 for SMS, 1 for WhatsApp

  Widget _buildMediumOption(String title, IconData icon, int index) {
    final bool isSelected = _selectedMedium == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedMedium = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFE7F8EF) : Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected ? const Color(0xFF10B981) : const Color(0xFFE2E8F0),
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? const Color(0xFF10B981) : const Color(0xFF64748B),
                size: 24.sp,
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? const Color(0xFF10B981) : const Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF8FAFC,
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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,

                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16.sp,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpace(10.w),
                    Text(
                      'রিমাইন্ডার পাঠান',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(24.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48.w,
                        width: 48.w,
                        decoration: BoxDecoration(
                          color: Color(0xFFE7F8EF),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            AssetsImages.anik,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      UIHelper.horizontalSpace(16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'রহিম মিয়া',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF0F172A),
                              ),
                            ),
                            UIHelper.verticalSpace(4.h),
                            Text(
                              '৳ ৩,৪৫০ বাকি • +880 1712 345 678',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                CommonTextFormField(
                  label: 'রিমাইন্ডার তারিখ',
                  hintText: '',
                  prefixIcon: Image.asset(
                    AssetsIcons.calendarIcon,
                    height: 16.h,
                    width: 16.w,
                    color: const Color(0xFF10B981),
                  ),
                ),
                UIHelper.verticalSpace(24.h),
                CommonTextFormField(
                  label: 'SMS বার্তা',
                  hintText:
                      'প্রিয় রহিম ভাই, আপনার বাকি পরিমাণ ৳3,450 টাকা। অনুগ্রহ করে পরিশোধ করুন। — করিম স্টোর',
                  maxLines: 4,
                ),
                UIHelper.verticalSpace(12.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        size: 16.sp,
                        color: const Color(0xFF10B981),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'সম্পাদনা',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF10B981),
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'পাঠানোর মাধ্যম',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF475569),
                        ),
                      ),
                      UIHelper.verticalSpace(12.h),
                      Row(
                        children: [
                          _buildMediumOption('SMS', Icons.message_outlined, 0),
                          SizedBox(width: 16.w),
                          _buildMediumOption('WhatsApp', Icons.forum_outlined, 1),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
