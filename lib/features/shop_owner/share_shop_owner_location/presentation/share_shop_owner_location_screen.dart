import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tally_khata/common_wigdets/common_button.dart';
import 'package:tally_khata/constants/app_assets/assets_image.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class ShareShopOwnerLocationScreen extends StatelessWidget {
  const ShareShopOwnerLocationScreen({super.key});

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
                      'দোকানের লোকেশন শেয়ার',
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
                          child: Icon(
                            Icons.map_outlined,
                            size: 48,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.cF8FAFC,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 48.r,
                            width: 48.r,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCFCE7),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(
                              Icons.storefront_outlined,
                              size: 26.r,
                              color: Color(0xFF16A34A),
                            ),
                          ),
                          UIHelper.horizontalSpace(12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'করিম জেনারেল স্টোর',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                UIHelper.verticalSpace(4.h),
                                Text(
                                  'মিরপুর ১০, ব্লক-বি, ঢাকা',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF64748B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(12.h),
                      Divider(color: const Color(0xFFE2E8F0), height: 1.h),
                      UIHelper.verticalSpace(12.h),
                      Text(
                        'এই লোকেশন আপনার দোকানের পাবলিক প্রোফাইলে দেখাবে যাতে গ্রাহকরা সহজে খুঁজে পান',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: const Color(0xFF64748B),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        label: Text(
                          'শেয়ার করুন',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(0, 48.h),
                          side: const BorderSide(color: Color(0xFFCBD5E1)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpace(12.w),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 18.r,
                          color: Colors.black,
                        ),
                        label: Text(
                          'পরিবর্তন',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(0, 48.h),
                          side: const BorderSide(color: Color(0xFFCBD5E1)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(12.h),
                CommonButton(text: 'লোকেশন নিশ্চিত করুন', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
