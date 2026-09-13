import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tally_khata/constants/app_assets/assets_image.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class NearbyReaminingCustomerScreen extends StatelessWidget {
  const NearbyReaminingCustomerScreen({super.key});

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
                UIHelper.verticalSpace(16.h),
                Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back_ios, size: 22.r),
                  ),
                  UIHelper.horizontalSpace(20.w),
                  Text(
                    'বাকি আদায়ের রুট',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(16.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Container(
                  height: 220.h,
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset(
                    AssetsImages.locationPinImage,
                    width: double.infinity,
                    height: 220.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFFE2E8F0),
                      child: const Center(
                        child: Icon(Icons.map_outlined, size: 48, color: Colors.grey),
                      ),
                    ),
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
