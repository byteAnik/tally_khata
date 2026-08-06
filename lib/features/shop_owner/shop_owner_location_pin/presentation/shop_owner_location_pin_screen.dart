import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tally_khata/common_wigdets/common_button.dart';
import 'package:tally_khata/common_wigdets/common_textform_flied.dart';
import 'package:tally_khata/constants/app_assets/assets_image.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class ShopOwnerLocationPinScreen extends StatelessWidget {
  const ShopOwnerLocationPinScreen({super.key});

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
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back_ios, size: 22.r),
                    ),
                    UIHelper.horizontalSpace(20.w),
                    Text(
                      'লোকেশন পিন করুন',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(20.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    AssetsImages.locationPinImage,
                    width: double.infinity,
                    height: 300.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 500.h,
                        color: Colors.grey.shade300,
                        alignment: Alignment.center,
                        child: Text(
                          error.toString(),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),

                CommonTextFormField(
                  label: '',
                  hintText: 'এলাকা বা ঠিকানা খুঁজুন...',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 22.r,
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                CommonButton(
                  text: 'লোকেশন সংরক্ষণ করুন', 
                  onPressed: () {}
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
