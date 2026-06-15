import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';
import 'package:tally_khata/features/report/presentation/widgets/filter_chips.dart';
import 'package:tally_khata/features/report/presentation/widgets/income_card.dart';
import 'package:tally_khata/features/report/presentation/widgets/stat_card.dart';
import 'package:tally_khata/features/report/presentation/widgets/monthly_income_graph.dart';
import 'package:tally_khata/features/report/presentation/widgets/collection_rate_trend.dart';
import 'package:tally_khata/features/report/presentation/widgets/due_distribution_chart.dart';
import 'package:tally_khata/features/report/presentation/widgets/export_buttons.dart';
import 'package:tally_khata/features/report/presentation/widgets/premium_banner.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int selectedIndex = 0;

  final List<String> filters = ["৩ মাস", "৬ মাস", "১ বছর"];

  final List<Map<String, dynamic>> statCardsData = [
    {
      "title": "মোট বাকি",
      "amount": "৳34,250",
      "amountColor": const Color(0xFFEF4444),
      "icon": Icons.arrow_downward,
      "iconColor": const Color(0xFFEF4444),
      "iconBgColor": const Color(0xFFFEE2E2),
      "percentage": "5%",
    },
    {
      "title": "সংগ্রহ হার",
      "amount": "78%",
      "amountColor": const Color(0xFF10B981),
      "icon": Icons.arrow_upward,
      "iconColor": const Color(0xFF10B981),
      "iconBgColor": const Color(0xFFD1FAE5),
      "percentage": "3%",
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(10.h),

                Text(
                  "রিপোর্ট",
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: const Color(0xFF0F172A),
                    fontWeight: FontWeight.w800,
                  ),
                ),

                UIHelper.verticalSpace(4.h),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'করিম জেনারেল স্টোর',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c848484,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    UIHelper.horizontalSpace(8.w),
                    FilterChips(
                      filters: filters,
                      selectedIndex: selectedIndex,
                      onSelected: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ],
                ),

                UIHelper.verticalSpace(24.h),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: IncomeCard(),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          statCardsData.length,
                          (index) {
                            final data = statCardsData[index];
                            return Column(
                              children: [
                                StatCard(
                                  title: data["title"],
                                  amount: data["amount"],
                                  amountColor: data["amountColor"],
                                  icon: data["icon"],
                                  iconColor: data["iconColor"],
                                  iconBgColor: data["iconBgColor"],
                                  percentage: data["percentage"],
                                ),
                                if (index != statCardsData.length - 1)
                                  UIHelper.verticalSpace(10.h),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                UIHelper.verticalSpace(16.h),
                MonthlyIncomeGraph(filterIndex: selectedIndex),
                
                UIHelper.verticalSpace(16.h),
                CollectionRateTrend(filterIndex: selectedIndex),
                
                UIHelper.verticalSpace(16.h),
                const DueDistributionChart(),

                UIHelper.verticalSpace(16.h),
                const ExportButtonsRow(),

                UIHelper.verticalSpace(16.h),
                const PremiumBanner(),

                UIHelper.verticalSpace(30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
