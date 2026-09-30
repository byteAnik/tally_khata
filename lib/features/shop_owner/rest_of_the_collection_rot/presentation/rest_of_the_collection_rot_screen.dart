import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tally_khata/constants/app_assets/assets_image.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class RestOfTheCollectionRotScreen extends StatelessWidget {
  const RestOfTheCollectionRotScreen({super.key});

  static final List<Map<String, dynamic>> _routeInfoItems = [
    {'label': 'মোট দূরত্ব', 'value': '৬.৪ কিমি'},
    {'label': 'সময়', 'value': '৪২ মিনিট'},
    {'label': 'স্টপ', 'value': '৫ জন'},
  ];

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
                UIHelper.verticalSpace(20.h),

                // Route Info Container
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Row(
                          children: List.generate(
                            _routeInfoItems.length * 2 - 1,
                            (index) {
                              if (index.isOdd) {
                                return Container(
                                  height: 40.h,
                                  width: 1,
                                  color: Colors.grey.shade300,
                                );
                              }
                              final item = _routeInfoItems[index ~/ 2];
                              return Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['label'] ?? '',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      item['value'] ?? '',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey.shade300,
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Open Google Maps navigation
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                size: 18.r,
                                color: Colors.black,
                              ),
                              UIHelper.horizontalSpace(8.w),
                              Text(
                                'Google Maps-এ নেভিগেশন শুরু করুন',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                UIHelper.verticalSpace(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
