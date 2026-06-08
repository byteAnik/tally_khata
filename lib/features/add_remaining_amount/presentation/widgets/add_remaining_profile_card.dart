import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/constants/app_assets/assets_image.dart';

class AddReamainingProfileCard extends StatelessWidget {
  const AddReamainingProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            decoration: const BoxDecoration(
              color: Color(0xFFE7F8EF),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                AssetsImages.anik,
                width: 48.w,
                height: 48.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'রহিম মিয়া',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                SizedBox(height: 4.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFF64748B),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto', // assuming default font
                    ),
                    children: const [
                      TextSpan(text: 'বর্তমান বাকি — '),
                      TextSpan(
                        text: '৳ 3,450',
                        style: TextStyle(
                          color: Color(0xFFEF4444),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}