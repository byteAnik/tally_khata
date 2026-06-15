import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';

class DueDistributionChart extends StatelessWidget {
  const DueDistributionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "গ্রাহক-ভিত্তিক বাকি বিতরণ",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0F172A),
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              SizedBox(
                height: 140.h,
                width: 140.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 45.w,
                        sections: [
                          PieChartSectionData(
                            color: const Color(0xFFDC2626), // Overdue
                            value: 38,
                            title: '',
                            radius: 20.w,
                          ),
                          PieChartSectionData(
                            color: const Color(0xFF16A34A), // Normal due
                            value: 45,
                            title: '',
                            radius: 20.w,
                          ),
                          PieChartSectionData(
                            color: const Color(0xFF86EFAC), // Paid
                            value: 17,
                            title: '',
                            radius: 20.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLegendRow(const Color(0xFFDC2626), "ওভারডিউ", "38%"),
                    SizedBox(height: 12.h),
                    _buildLegendRow(const Color(0xFF16A34A), "স্বাভাবিক বাকি", "45%"),
                    SizedBox(height: 12.h),
                    _buildLegendRow(const Color(0xFF86EFAC), "পরিশোধিত", "17%"),
                    SizedBox(height: 16.h),
                    Divider(color: const Color(0xFFE2E8F0), height: 1),
                    SizedBox(height: 16.h),
                    Text(
                      "মোট গ্রাহক",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    Text(
                      "48 জন",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendRow(Color color, String text, String percentage) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0xFF64748B),
            ),
          ),
        ),
        Text(
          percentage,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }
}
