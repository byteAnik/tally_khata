import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tally_khata/common_wigdets/common_button.dart';
import 'package:tally_khata/common_wigdets/custom_textform_flield.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class AddCustomerScreen extends StatelessWidget {
  const AddCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UIHelper.kDefaulutPadding(),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(16.h),

                // ── AppBar Row ──────────────────────────────────────────────
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16.sp,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'নতুন গ্রাহক',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),

                UIHelper.verticalSpace(28.h),

                // ── Photo Upload ────────────────────────────────────────────
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 88.w,
                        width: 88.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE7F8EF),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF10B981),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 30.sp,
                            color: const Color(0xFF10B981),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'ছবি যোগ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF10B981),
                        ),
                      ),
                    ],
                  ),
                ),

                UIHelper.verticalSpace(28.h),

                // ── পূর্ণ নাম ──────────────────────────────────────────────
                CommonTextField(
                  labelText: 'পূর্ণ নাম',
                  hintText: 'রহিম মিয়া',
                  prefixIcon: Icons.person_outline_rounded,
                ),

                UIHelper.verticalSpace(16.h),

                // ── ফোন নম্বর ──────────────────────────────────────────────
                CommonTextField(
                  labelText: 'ফোন নম্বর',
                  hintText: '+880 1712 345 678',
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                ),
                UIHelper.verticalSpace(16.h),
                CommonTextField(
                  labelText: 'ঠিকানা',
                  hintText: 'মিরপুর ১০, ঢাকা',
                  prefixIcon: Icons.location_on_outlined,
                ),
                UIHelper.verticalSpace(16.h),
                CommonTextField(
                  labelText: 'প্রারম্ভিক বাকি',
                  hintText: '৳ ০',
                  prefixIcon: Icons.currency_exchange_outlined,
                  keyboardType: TextInputType.number,
                ),

                UIHelper.verticalSpace(16.h),
                CommonTextField(
                  labelText: 'নোট',
                  hintText: 'কোনো বিশেষ তথ্য...',
                  prefixIcon: Icons.note_outlined,
                  maxLines: 3,
                ),
                UIHelper.verticalSpace(32.h),

                // ── Submit Button ───────────────────────────────────────────
                CommonButton(text: 'গ্রাহক সংরক্ষণ করুন', onPressed: () {}),

                UIHelper.verticalSpace(24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
