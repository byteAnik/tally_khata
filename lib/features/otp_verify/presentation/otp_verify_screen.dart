import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:tally_khata/common_wigdets/common_button.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/constants/validator.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 64.w,
      height: 64.h,
      textStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF0F172A),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFD4D4D8)),
      ),
    );

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
                
                // ── Icon (Matches Login Screen) ─────────────────────────────
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
                        Icons.security_rounded,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),

                UIHelper.verticalSpace(34.h),

                // ── Title (Matches Login Screen) ────────────────────────────
                Text(
                  "Verify OTP",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F172A),
                    height: 1.2,
                  ),
                ),
                
                UIHelper.verticalSpace(12.h),

                // ── Subtitle (Matches Login Screen) ─────────────────────────
                Text(
                  'Enter the 4-digit OTP code we sent\nto your phone number.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF64748B),
                    height: 1.6,
                  ),
                ),
                
                UIHelper.verticalSpace(38.h),
                
                // ── OTP Field ───────────────────────────────────────────────
                Center(
                  child: Pinput(
                    length: 4,
                    controller: _otpController,
                    validator: validate4DigitPinCode,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: const Color(0xFF10B981), width: 2),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: const Color(0xFFF8FAFC),
                        border: Border.all(color: const Color(0xFF10B981)),
                      ),
                    ),
                  ),
                ),

                UIHelper.verticalSpace(34.h),

                // ── Button ──────────────────────────────────────────────────
                CommonButton(text: 'Verify', onPressed: () {}),

                UIHelper.verticalSpace(30.h),

                // ── Resend Text ─────────────────────────────────────────────
                Center(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 15, // .sp handled automatically if RichText isn't explicitly sizing, but let's just use normal fontSize or add .sp
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF64748B),
                      ),
                      children: [
                        TextSpan(text: "Didn't receive code? "),
                        TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                            color: Color(0xFF059669),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
