import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';

class MonthlyIncomeGraph extends StatelessWidget {
  final int filterIndex;
  
  const MonthlyIncomeGraph({super.key, required this.filterIndex});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> allTitles = [
      ['মার্চ', 'এপ্রি', 'মে'],
      ['ডিসে', 'জানু', 'ফেব্রু', 'মার্চ', 'এপ্রি', 'মে'],
      ['জুন', 'জুল', 'আগ', 'সেপ্টে', 'অক্টো', 'নভে', 'ডিসে', 'জানু', 'ফেব্রু', 'মার্চ', 'এপ্রি', 'মে'],
    ];

    final List<List<Map<String, double>>> allDataPoints = [
      [
        {'income': 11, 'due': 3},
        {'income': 10.5, 'due': 3.2},
        {'income': 12.5, 'due': 3.5},
      ],
      [
        {'income': 7, 'due': 2},
        {'income': 8, 'due': 2.5},
        {'income': 9.5, 'due': 2.8},
        {'income': 11, 'due': 3},
        {'income': 10.5, 'due': 3.2},
        {'income': 12.5, 'due': 3.5},
      ],
      [
        {'income': 5, 'due': 1},
        {'income': 6, 'due': 1.5},
        {'income': 5.5, 'due': 1.2},
        {'income': 6.5, 'due': 1.8},
        {'income': 7, 'due': 2},
        {'income': 6.8, 'due': 1.9},
        {'income': 7, 'due': 2},
        {'income': 8, 'due': 2.5},
        {'income': 9.5, 'due': 2.8},
        {'income': 11, 'due': 3},
        {'income': 10.5, 'due': 3.2},
        {'income': 12.5, 'due': 3.5},
      ],
    ];

    final titles = allTitles[filterIndex];
    final dataPoints = allDataPoints[filterIndex];

    final double barWidth = filterIndex == 2 ? 6.w : 14.w;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "মাসিক আয়ের গ্রাফ",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
              ),
              Row(
                children: [
                  _buildLegendItem(const Color(0xFF4ADE80), "আয়"),
                  SizedBox(width: 12.w),
                  _buildLegendItem(const Color(0xFFF87171), "বাকি"),
                ],
              )
            ],
          ),
          SizedBox(height: 24.h),
          SizedBox(
            height: 180.h,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 14,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() < 0 || value.toInt() >= titles.length) return const SizedBox.shrink();
                        
                        if (filterIndex == 2 && value.toInt() % 2 != 0) {
                          return const SizedBox.shrink();
                        }
                        
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            titles[value.toInt()],
                            style: TextStyle(
                              color: const Color(0xFF64748B),
                              fontSize: 12.sp,
                            ),
                          ),
                        );
                      },
                      reservedSize: 30,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) return const SizedBox.shrink();
                        return Text(
                          "৳${value.toInt()}k",
                          style: TextStyle(
                            color: const Color(0xFF64748B),
                            fontSize: 12.sp,
                          ),
                        );
                      },
                      reservedSize: 40,
                      interval: 2,
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 2,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color(0xFFE2E8F0),
                    strokeWidth: 1,
                    dashArray: [4, 4],
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(dataPoints.length, (index) {
                  return _buildBarGroup(index, dataPoints[index]['income']!, dataPoints[index]['due']!, barWidth);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double income, double due, double width) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: income,
          color: const Color(0xFF4ADE80),
          width: width,
          borderRadius: BorderRadius.circular(2.r),
        ),
        BarChartRodData(
          toY: due,
          color: const Color(0xFFF87171),
          width: width,
          borderRadius: BorderRadius.circular(2.r),
        ),
      ],
      barsSpace: 4.w,
    );
  }

  Widget _buildLegendItem(Color color, String text) {
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
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }
}

