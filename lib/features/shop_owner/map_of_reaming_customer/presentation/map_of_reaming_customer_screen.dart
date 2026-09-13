import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tally_khata/constants/app_assets/assets_image.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class MapOfReamingCustomerScreen extends StatefulWidget {
  const MapOfReamingCustomerScreen({super.key});

  @override
  State<MapOfReamingCustomerScreen> createState() =>
      _MapOfReamingCustomerScreenState();
}

class _MapOfReamingCustomerScreenState
    extends State<MapOfReamingCustomerScreen> {
  int _selectedFilter = 0; // 0 for সবাই (৫), 1 for ওভারডিউ (২)

  final List<Map<String, String>> _allCustomers = [
    {
      "name": "রহিম ট্রেডার্স",
      "amount": "৳ ৩,৪৫০",
      "address": "মিরপুর ১০, ঢাকা",
      "status": "সবাই",
    },
    {
      "name": "করিম স্টোর",
      "amount": "৳ ১,২০০",
      "address": "ফার্মগেট, ঢাকা",
      "status": "ওভারডিউ",
    },
    {
      "name": "আরিফ এন্টারপ্রাইজ",
      "amount": "৳ ৫,০০০",
      "address": "ধানমন্ডি ২৭, ঢাকা",
      "status": "সবাই",
    },
    {
      "name": "সাকিব জেনারেল স্টোর",
      "amount": "৳ ২,১০০",
      "address": "উত্তরা সেক্টর ৩, ঢাকা",
      "status": "ওভারডিউ",
    },
    {
      "name": "তানভীর ট্রেডিং",
      "amount": "৳ ৪,৩০০",
      "address": "গুলশান ২, ঢাকা",
      "status": "সবাই",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredList = _selectedFilter == 0
        ? _allCustomers
        : _allCustomers.where((c) => c['status'] == 'ওভারডিউ').toList();

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
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back_ios, size: 22.r),
                  ),
                  UIHelper.horizontalSpace(20.w),
                  Text(
                    'বাকি গ্রাহকদের ম্যাপ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(16.h),
              // Filter Chips matching light background
              Row(
                children: [
                  _buildFilterChip('সবাই (৫)', 0),
                  SizedBox(width: 10.w),
                  _buildFilterChip('ওভারডিউ (২)', 1),
                ],
              ),
              UIHelper.verticalSpace(16.h),
              // Map View Section
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
              UIHelper.verticalSpace(16.h),
              Text(
                'গ্রাহকদের তালিকা',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              UIHelper.verticalSpace(10.h),
              // Expanded(
              //   child: ListView.separated(
              //     physics: const BouncingScrollPhysics(),
              //     itemCount: filteredList.length,
              //     separatorBuilder: (context, index) => SizedBox(height: 10.h),
              //     itemBuilder: (context, index) {
              //       final customer = filteredList[index];
              //       return Container(
              //         padding: EdgeInsets.all(14.r),
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(12.r),
              //           border: Border.all(color: const Color(0xFFE2E8F0)),
              //         ),
              //         child: Row(
              //           children: [
              //             Container(
              //               height: 40.r,
              //               width: 40.r,
              //               decoration: const BoxDecoration(
              //                 color: Color(0xFFE7F8EF),
              //                 shape: BoxShape.circle,
              //               ),
              //               child: Icon(
              //                 Icons.person_outline,
              //                 color: const Color(0xFF10B981),
              //                 size: 22.r,
              //               ),
              //             ),
              //             SizedBox(width: 12.w),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     customer['name']!,
              //                     style: TextStyle(
              //                       fontSize: 14.sp,
              //                       fontWeight: FontWeight.w600,
              //                       color: const Color(0xFF0F172A),
              //                     ),
              //                   ),
              //                   SizedBox(height: 2.h),
              //                   Text(
              //                     customer['address']!,
              //                     style: TextStyle(
              //                       fontSize: 12.sp,
              //                       color: const Color(0xFF64748B),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Text(
              //               customer['amount']!,
              //               style: TextStyle(
              //                 fontSize: 14.sp,
              //                 fontWeight: FontWeight.w700,
              //                 color: const Color(0xFFEF4444),
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
              UIHelper.verticalSpace(20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '৫ জন গ্রাহক ম্যাপে দেখানো হচ্ছে',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'মোট বাকি ৳১১,২০০ — তালিকা দেখুন',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: const Color(0xFF64748B),
                      size: 22.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String title, int index) {
    final bool isSelected = _selectedFilter == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF10B981) : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF10B981) : const Color(0xFFCBD5E1),
            width: 1,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF475569),
          ),
        ),
      ),
    );
  }
}
