import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class CustomerSettingsScreen extends StatelessWidget {
  const CustomerSettingsScreen({super.key});

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
                Text(
                  'সেটিংস',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.c1F222A,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.c10BA00,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24.r,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child: Text(
                          'ক',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.cFFFFFF,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      UIHelper.horizontalSpace(12.w),
                      Expanded(
                        child: Text(
                          'করিম জেনারেল স্টোর',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.cFFFFFF,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(18.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cF8FAFC,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      _SettingsTile(
                        icon: Icons.map_outlined,
                        iconColor: AppColors.c146DFF,
                        iconBackgroundColor: AppColors.cE9F3FF,
                        title: 'দোকানের লোকেশন',
                        onTap: () {},
                      ),
                      Divider(height: 1.h, color: Colors.grey.shade300),
                      _SettingsTile(
                        icon: Icons.workspace_premium_outlined,
                        iconColor: AppColors.cC99800,
                        iconBackgroundColor: AppColors.cFFEA94,
                        title: 'প্রিমিয়াম প্ল্যান',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(14.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cF8FAFC,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: _SettingsTile(
                    icon: Icons.logout,
                    iconColor: AppColors.cEF4444,
                    iconBackgroundColor: AppColors.cFFD5DE,
                    title: 'লগআউট',
                    titleColor: AppColors.cEF4444,
                    showArrow: false,
                    onTap: () {},
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

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.title,
    required this.onTap,
    this.titleColor,
    this.showArrow = true,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final Color? titleColor;
  final bool showArrow;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Container(
              height: 34.h,
              width: 34.w,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Icon(icon, size: 18.sp, color: iconColor),
            ),
            UIHelper.horizontalSpace(12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: titleColor ?? AppColors.c1F222A,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (showArrow)
              Icon(Icons.chevron_right, size: 20.sp, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
