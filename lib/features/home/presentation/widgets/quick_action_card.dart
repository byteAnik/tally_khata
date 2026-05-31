import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tally_khata/features/customer_list/presentation/customer_list_screen.dart';

class QuickActionCard extends StatelessWidget {
  QuickActionCard({super.key});

  final List<Map<String, dynamic>> quickActions = [
    {
      "title": "বাকি দিন",
      "subtitle": "নতুন বাকি যোগ",
      "icon": Icons.add,
      "iconColor": const Color(0xFFF43F5E),
      "bgColor": const Color(0xFFFFE4E6),
    },
    {
      "title": "পেমেন্ট নিন",
      "subtitle": "টাকা পেলে এখানে",
      "icon": Icons.payments_outlined,
      "iconColor": const Color(0xFF10B981),
      "bgColor": const Color(0xFFD1FAE5),
    },
    {
      "title": "গ্রাহক যোগ",
      "subtitle": "নতুন কাস্টমার",
      "icon": Icons.person_add_alt_1_outlined,
      "iconColor": const Color(0xFF3B82F6),
      "bgColor": const Color(0xFFDBEAFE),
    },
    {
      "title": "রিপোর্ট",
      "subtitle": "মাসিক হিসাব",
      "icon": Icons.bar_chart_rounded,
      "iconColor": const Color(0xFFF59E0B),
      "bgColor": const Color(0xFFFEF3C7),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: quickActions.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1.35,
      ),
      itemBuilder: (context, index) {
        final action = quickActions[index];

        return InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () {
            // 👉 Index based navigation
            if (index == 2) {
              Get.to(() => CustomerListScreen());
            }
          },
          child: Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.w,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: action['bgColor'],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Icon(
                      action['icon'],
                      color: action['iconColor'],
                      size: 22.sp,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  action['title'],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  action['subtitle'],
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
