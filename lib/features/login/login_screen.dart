import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tally_khata/common_wigdets/common_button.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/features/otp_verify/presentation/otp_verify_screen.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UIHelper.kDefaulutPadding(),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(40.h),

                // ── Logo ────────────────────────────────────────────────────
                Container(
                  height: 56.h,
                  width: 56.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7F8EF),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.add_business_rounded,
                        color: Colors.white,
                        size: 26.sp,
                      ),
                    ),
                  ),
                ),

                UIHelper.verticalSpace(34.h),

                // ── Title ───────────────────────────────────────────────────
                Text(
                  'স্বাগতম!',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F172A),
                    height: 1.2,
                  ),
                ),

                UIHelper.verticalSpace(12.h),

                // ── Subtitle ────────────────────────────────────────────────
                Text(
                  'Please enter your phone number to\nlogin or create a new account.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF64748B),
                    height: 1.6,
                  ),
                ),

                UIHelper.verticalSpace(38.h),

                // ── Label ───────────────────────────────────────────────────
                Text(
                  'PHONE NUMBER',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: const Color(0xFF475569),
                  ),
                ),

                UIHelper.verticalSpace(14.h),

                // ── Phone Field ─────────────────────────────────────────────
                Container(
                  height: 64.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(color: const Color(0xFFD4D4D8)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 105.w,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18.r),
                            bottomLeft: Radius.circular(18.r),
                          ),
                          border: Border(
                            right: BorderSide(color: const Color(0xFFD4D4D8)),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'BD +880',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF0F172A),
                            ),
                            decoration: InputDecoration(
                              hintText: '1712-345678',
                              hintStyle: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF0F172A),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                UIHelper.verticalSpace(34.h),

                // ── Button ──────────────────────────────────────────────────
                CommonButton(
                  text: 'Contiune',
                  onPressed: () {
                    Get.to(() => OtpVerifyScreen());
                  },
                ),

                SizedBox(height: 240.h),

                // ── Security Text ───────────────────────────────────────────
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.verified_user_outlined,
                          color: const Color(0xFF10B981),
                          size: 18.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Your data is 100% secure with us',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                // ── Terms Text ──────────────────────────────────────────────
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF94A3B8),
                        height: 1.6,
                      ),
                      children: const [
                        TextSpan(text: 'By continuing, you agree to our '),
                        TextSpan(
                          text: 'Terms of\nService',
                          style: TextStyle(
                            color: Color(0xFF059669),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Color(0xFF059669),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
