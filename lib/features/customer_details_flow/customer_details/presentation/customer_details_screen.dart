import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/features/customer_details_flow/add_customer_reamining/presentation/add_customer_reamining_screen.dart';
import 'package:tally_khata/features/customer_details_flow/customer_details/presentation/widgets/customer_action_button.dart';
import 'package:tally_khata/features/customer_details_flow/customer_details/presentation/widgets/customer_header_section.dart';
import 'package:tally_khata/features/customer_details_flow/customer_payment_reamining/presentation/customer_payment_reamining_screen.dart';
import 'package:tally_khata/features/customer_details_flow/customer_remainder/presentation/customer_remainder_screen.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class CustomerDetailsScreen extends StatefulWidget {
  const CustomerDetailsScreen({super.key});

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  final List<Map<String, dynamic>> dummyCustomerTransactions = [
    {
      "isDue": true,
      "title": "বাকি যোগ হয়েছে",
      "subtitle": "চাল ৫ কেজি • আজ ১০:৩০ AM",
      "amount": "-৳650",
    },
    {
      "isDue": false,
      "title": "পেমেন্ট পাওয়া গেছে",
      "subtitle": "নগদ • গতকাল ৪:১৫ PM",
      "amount": "+৳1,000",
    },
    {
      "isDue": true,
      "title": "বাকি যোগ হয়েছে",
      "subtitle": "ডাল ২ কেজি • ১০ মে",
      "amount": "-৳450",
    },
    {
      "isDue": false,
      "title": "পেমেন্ট পাওয়া গেছে",
      "subtitle": "বিকাশ • ৮ মে",
      "amount": "+৳2,000",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF8FAFC, // Matches home_screen.dart
      body: Column(
        children: [
          CustommerHeaderSection(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: UIHelper.kDefaulutPadding(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpace(15.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => AddCustomerReaminingScreen());
                        },
                        child: Expanded(
                          child: CustomerActionButton(
                            icon: Icons.add,
                            label: "বাকি দিন",
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => CustomerPaymentReaminingScreen());
                        },
                        child: Expanded(
                          child: CustomerActionButton(
                            icon: Icons.receipt_long_outlined,
                            label: "পেমেন্ট",
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => CustomerRemainderScreen());
                        },
                        child: Expanded(
                          child: CustomerActionButton(
                            icon: Icons.notifications_active_outlined,
                            label: "রিমাইন্ড",
                            isFilled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(32.h),

                  // Transaction History Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "লেনদেনের ইতিহাস",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                      Text(
                        "ফিল্টার",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF10B981),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Transactions Timeline
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: dummyCustomerTransactions.length,
                    itemBuilder: (context, index) {
                      final transaction = dummyCustomerTransactions[index];
                      final bool isDue = transaction['isDue'];
                      final bool isLast =
                          index == dummyCustomerTransactions.length - 1;

                      return Stack(
                        children: [
                          // Timeline vertical line
                          if (!isLast)
                            Positioned(
                              top: 24.h + 12.w, // Start just below the dot
                              bottom: 0,
                              left: 4
                                  .w, // Center of the 12.w dot (which has no horizontal margin)
                              child: Container(
                                width: 2.w,
                                color: const Color(0xFFE2E8F0),
                              ),
                            ),
                          // Main content Row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Timeline indicator (dot)
                              SizedBox(
                                width: 10.w, // Match dot width approx
                                child: Column(
                                  children: [
                                    SizedBox(height: 24.h),
                                    Container(
                                      width: 10.w,
                                      height: 10.w,
                                      decoration: BoxDecoration(
                                        color: isDue
                                            ? const Color(0xFFEF4444)
                                            : const Color(0xFF10B981),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16.w),
                              // Transaction Card
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: Container(
                                    padding: EdgeInsets.all(16.r),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16.r),
                                      border: Border.all(
                                        color: const Color(0xFFE2E8F0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                transaction['title'],
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(
                                                    0xFF0F172A,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 4.h),
                                              Text(
                                                transaction['subtitle'],
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color(
                                                    0xFF64748B,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          transaction['amount'],
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: isDue
                                                ? const Color(0xFFEF4444)
                                                : const Color(0xFF10B981),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
