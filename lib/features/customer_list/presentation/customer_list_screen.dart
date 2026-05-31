import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/features/customer_list/presentation/widgets/customer_clip.dart';
import 'package:tally_khata/features/customer_list/presentation/widgets/customer_list_item.dart';
import 'package:tally_khata/features/customer_list/presentation/widgets/customer_search_flield.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

// ── Dummy Data ──
final List<String> filterChips = ['সব (৪৮)', 'বাকি আছে', 'ওভারডিউ', 'পরিশোধ'];

final List<Map<String, dynamic>> dummyCustomers = [
  {
    "avatarText": "আ",
    "name": "আলী সিকদার",
    "phone": "+880 1744 888 999",
    "statusText": "৭ দিন ওভারডিউ",
    "amount": "৳5,100",
    "amountLabel": "বকেয়া",
    "isPaid": false,
  },
  {
    "avatarText": "রহ",
    "name": "রহিম মিয়া",
    "phone": "+880 1712 345 678",
    "statusText": "৩ দিন বাকি",
    "amount": "৳3,450",
    "amountLabel": "বকেয়া",
    "isPaid": false,
  },
  {
    "avatarText": "না",
    "name": "নাজমা বেগম",
    "phone": "+880 1922 111 222",
    "statusText": "",
    "amount": "৳1,200",
    "amountLabel": "বকেয়া",
    "isPaid": false,
  },
  {
    "avatarText": "সু",
    "name": "সুমন আহমেদ",
    "phone": "+880 1819 000 001",
    "statusText": "পরিশোধ",
    "amount": "৳0",
    "amountLabel": "ক্লিয়ার",
    "isPaid": true,
  },
  {
    "avatarText": "কা",
    "name": "কামাল হোসেন",
    "phone": "+880 1600 555 777",
    "statusText": "",
    "amount": "৳800",
    "amountLabel": "বকেয়া",
    "isPaid": false,
  },
];

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  String _selectedChip = 'সব (৪৮)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Light background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: UIHelper.kDefaulutPadding(),
            ),
            child: Column(
              children: [
                // ── Header ──
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'গ্রাহক তালিকা',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'মোট ৪৮ জন • ৳৩৪,২৫০ বাকি',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                UIHelper.verticalSpace(10.h),
                CustomerSearchFlield(),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 38.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: filterChips.length,
                    itemBuilder: (context, index) {
                      final label = filterChips[index];
                      return CustomerClip(
                        label: label,
                        isSelected: _selectedChip == label,
                        onTap: () {
                          setState(() {
                            _selectedChip = label;
                          });
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: 16.h),

                // ── Customer List ──
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // List container bg
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: dummyCustomers.length,
                      separatorBuilder: (context, index) => const Divider(
                        color: Color(0xFFF1F5F9),
                        height: 1,
                        thickness: 1,
                      ),
                      itemBuilder: (context, index) {
                        final customer = dummyCustomers[index];
                        return CustomerListItem(customer: customer);
                      },
                    ),
                  ),
                ),

                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF10B981),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
