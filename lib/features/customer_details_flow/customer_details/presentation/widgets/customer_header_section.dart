import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tally_khata/constants/app_assets/assets_image.dart';
import 'package:tally_khata/features/customer_details_flow/customer_details/presentation/widgets/customer_card.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class CustommerHeaderSection extends StatelessWidget {
  const CustommerHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16.h,
        left: 24.w,
        right: 24.w,
        bottom: 24.h,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF10B981), // Vibrant brand emerald green
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // AppBar part
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    "গ্রাহকের বিবরণ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          // Profile part
          Row(
            children: [
              Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    AssetsImages.anik,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              UIHelper.horizontalSpace(16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "রহিম মিয়া",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_outlined,
                          color: Colors.white.withOpacity(0.9),
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "+880 1712 345 678",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white.withOpacity(0.9),
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "মিরপুর ১০, ঢাকা",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 13.sp,
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
          // Summary Card
          CustomerCard(),
        ],
      ),
    );
  }
}

