import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:tally_khata/features/customer_details_flow/customer_details/presentation/customer_details_screen.dart';
import 'package:tally_khata/features/home/presentation/widgets/blance_card.dart';
import 'package:tally_khata/features/home/presentation/widgets/quick_action_card.dart';
import 'package:tally_khata/features/home/presentation/widgets/transaction_item.dart';

final List<Map<String, dynamic>> dummyTransactions = [
  {
    "name": "রাকিব হাসান",
    "date": "আজ, সকাল ১০:৩০",
    "amount": "৳ ৫০০",
    "type": "received",
  },
  {
    "name": "শরীফ আহমেদ",
    "date": "গতকাল, বিকেল ৪:১৫",
    "amount": "৳ ১,২০০",
    "type": "due",
  },
  {
    "name": "মায়ের দোয়া স্টোর",
    "date": "২৮ মে, সকাল ১১:০০",
    "amount": "৳ ৩,০০০",
    "type": "received",
  },
  {
    "name": "হাসান ট্রেডার্স",
    "date": "২৭ মে, সকাল ৯:২০",
    "amount": "৳ ৮৫০",
    "type": "due",
  },
  {
    "name": "জামাল ভান্ডার",
    "date": "২৫ মে, দুপুর ২:১০",
    "amount": "৳ ২,৫০০",
    "type": "received",
  },
];

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF8FAFC,
      ), // Clean light slate background matching other screens
      body: Column(
        children: [
          // ── Top Header Section (Green) ──
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20.h,
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
                // ── Header Profile & Notification ──
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "আসসালামুয়ালাইকুম",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "করিম ভান্ডার",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight
                                  .w800, // Matches bold typography from Login Screen
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: Colors.white.withOpacity(0.9),
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "মিরপুর ১০, ঢাকা",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Notification Icon
                    Container(
                      height: 48.h,
                      width: 48.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(
                              Icons.notifications_none_rounded,
                              color: Colors.white,
                              size: 26.sp,
                            ),
                          ),
                          Positioned(
                            right: 12,
                            top: 12,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF59E0B), // Amber badge
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF10B981),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 28.h),
                BlanceCard(),
              ],
            ),
          ),

          // ── Bottom Content Area ──
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuickActionCard(),

                    SizedBox(height: 32.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "সাম্প্রতিক লেনদেন",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                        Text(
                          "সব দেখুন",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF10B981),
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.to(() => CustomerDetailsScreen());
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dummyTransactions.length,
                        itemBuilder: (context, index) {
                          final tx = dummyTransactions[index];
                          return TransactionItem(
                            name: tx['name'],
                            date: tx['date'],
                            amount: tx['amount'],
                            type: tx['type'],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
