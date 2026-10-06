import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:svg_flutter/svg.dart';
import 'package:tally_khata/constants/app_assets/assets_icons.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/features/customer_list/presentation/customer_list_screen.dart';
import 'package:tally_khata/features/customer_settings/presentation/customer_settings_screen.dart';
import 'package:tally_khata/features/home/presentation/home_screen.dart';
import 'package:tally_khata/features/report/presentation/report_screen.dart';
import 'package:tally_khata/features/shop_owner/shop_owner_map/presentation/shop_owner_map_screen.dart';
import 'package:tally_khata/helpers/helper_methods.dart';


class NavigationBarScreen extends StatefulWidget {
  final int? pageNum;
  const NavigationBarScreen({super.key, this.pageNum});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  late int _currentIndex;

  final List<Widget> _screens = [
    HomeScreen1(),
    CustomerListScreen(),
    ShopOwnerMapScreen(),
    ReportScreen(),
    CustomerSettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.pageNum ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showMaterialDialog(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.cF8FAFC,
        extendBody: true,
        body: _screens[_currentIndex],
        
                
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.cF8FAFC,
            border: Border(
              top: BorderSide(color: const Color(0xFFF8FAFC), width: 1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.18 * 255).toInt()),
                blurRadius: 16,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: AppColors.cF8FAFC,
              currentIndex: _currentIndex,
              onTap: (index) {
                log("----------------index--$index");
                setState(() => _currentIndex = index);
              },
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: const Color(0xFF10B981),
              unselectedItemColor: const Color(0xFF8B8A8C),
              selectedFontSize: 12.sp,
              unselectedFontSize: 12.sp,
              iconSize: 24.sp,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                height: 1.2,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                height: 1.2,
              ),
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              items: [
                _buildNavItem(
                  iconPath: AssetsIcons.homeIcon,
                  label: "হোম",
                  index: 0,
                  isSvg: false,
                ),
                _buildNavItem(
                  iconPath: AssetsIcons.groupPersonIcon,
                  label: "গ্রাহক",
                  index: 1,
                  isSvg: false,
                ),
                _buildNavItem(
                  iconPath: AssetsIcons.mapIcon,
                  label: "ম্যাপ",
                  index: 2,
                  isSvg: false,
                ),
                _buildNavItem(
                  iconPath: AssetsIcons.reportIcon,
                  label: "রিপোর্ট",
                  index: 3,
                  isSvg: false,
                ),
                _buildNavItem(
                  iconPath: AssetsIcons.settingsIcon,
                  label: "সেটিংস",
                  index: 4,
                  isSvg: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
    required bool isSvg,
  }) {
    final bool isSelected = _currentIndex == index;
    final Color color =
        isSelected ? const Color(0xFF10B981) : const Color(0xFF8B8A8C);

    Widget iconWidget;

    if (isSvg) {
      iconWidget = Padding(
        padding: EdgeInsets.only(top: 6.h, bottom: 4.h),
        child: SvgPicture.asset(
          iconPath,
          height: 22.h,
          width: 22.w,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      );
    } else {
      iconWidget = Padding(
        padding: EdgeInsets.only(top: 6.h, bottom: 4.h),
        child: Image.asset(iconPath, height: 22.h, width: 22.w, color: color),
      );
    }

    return BottomNavigationBarItem(
      icon: iconWidget,
      activeIcon:
          isSvg
              ? Padding(
                padding: EdgeInsets.only(top: 6.h, bottom: 4.h),
                child: SvgPicture.asset(
                  iconPath,
                  height: 22.h,
                  width: 22.w,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF10B981),
                    BlendMode.srcIn,
                  ),
                ),
              )
              : Padding(
                padding: EdgeInsets.only(top: 6.h, bottom: 4.h),
                child: Image.asset(
                  iconPath,
                  height: 22.h,
                  width: 22.w,
                  color: Color(0xFF10B981),
                ),
              ),
      label: label,
    );
  }
}
