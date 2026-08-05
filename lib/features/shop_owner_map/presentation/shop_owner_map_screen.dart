import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class ShopOwnerMapScreen extends StatefulWidget {
  const ShopOwnerMapScreen({super.key});

  @override
  State<ShopOwnerMapScreen> createState() => _ShopOwnerMapScreenState();
}

class _ShopOwnerMapScreenState extends State<ShopOwnerMapScreen> {
  final List<Map<String, dynamic>> dummyMapItems = [
    {
      "icon": Icons.location_on_outlined,
      "iconColor": const Color(0xFF2563EB),
      "bgColor": const Color(0xFFE8F1FF),
      "title": "গ্রাহকের লোকেশন পিন করুন",
      "subtitle": "বাড়ি/দোকান ম্যাপে সেভ করুন",
    },
    {
      "icon": Icons.map_outlined,
      "iconColor": const Color(0xFFE11D48),
      "bgColor": const Color(0xFFFFEBF0),
      "title": "বাকি গ্রাহকদের ম্যাপ ভিউ",
      "subtitle": "কাছাকাছি কার বাকী আছে দেখুন",
    },
    {
      "icon": Icons.alt_route_rounded,
      "iconColor": const Color(0xFF10B981),
      "bgColor": const Color(0xFFDCFCE7),
      "title": "বাকি আদায়ের রুট প্লান",
      "subtitle": "কাছের গ্রাহকের সবচেয়ে কম দূরত্বে ঘুরে আসুন",
    },
    {
      "icon": Icons.storefront_outlined,
      "iconColor": const Color(0xFFD97706),
      "bgColor": const Color(0xFFFFF4E5),
      "title": "দোকানের লোকেশন শেয়ার",
      "subtitle": "গ্রাহকরা সহজে খুঁজে পাবে",
    },
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(20.h),
              Text(
                "ম্যাপ",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              UIHelper.verticalSpace(20.h),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: dummyMapItems.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final item = dummyMapItems[index];
                    return Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: item['bgColor'] as Color,
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: Icon(
                              item['icon'] as IconData,
                              color: item['iconColor'] as Color,
                              size: 24.sp,
                            ),
                          ),
                          SizedBox(width: 14.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'] as String,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF0F172A),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  item['subtitle'] as String,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF64748B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.chevron_right,
                            color: const Color(0xFF64748B),
                            size: 22.sp,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
