import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:tally_khata/features/add_customer/presentation/add_customer_screen.dart';
import 'package:tally_khata/features/customer_list/presentation/widgets/customer_clip.dart';
import 'package:tally_khata/features/customer_list/presentation/widgets/customer_list_item.dart';
import 'package:tally_khata/features/customer_list/presentation/widgets/customer_search_flield.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';
import 'package:tally_khata/provider/customer_provider.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  int _selectedChipIndex = 0;
  String _searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _toBengaliDigits(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const bengali = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    String result = input;
    for (int i = 0; i < english.length; i++) {
      result = result.replaceAll(english[i], bengali[i]);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context);
    final allCustomers = customerProvider.customers;

    // Filter by Search Query
    List<Map<String, dynamic>> searchFiltered = allCustomers;
    if (_searchQuery.isNotEmpty) {
      searchFiltered = allCustomers.where((c) {
        final name = c['name'].toString().toLowerCase();
        final phone = c['phone'].toString().toLowerCase();
        final query = _searchQuery.toLowerCase();
        return name.contains(query) || phone.contains(query);
      }).toList();
    }

    // Filter by Chips
    List<Map<String, dynamic>> finalFiltered = searchFiltered;
    if (_selectedChipIndex == 1) {
      finalFiltered = searchFiltered.where((c) => c['isPaid'] == false).toList();
    } else if (_selectedChipIndex == 2) {
      finalFiltered = searchFiltered.where((c) => c['statusText'].toString().contains('ওভারডিউ')).toList();
    } else if (_selectedChipIndex == 3) {
      finalFiltered = searchFiltered.where((c) => c['isPaid'] == true).toList();
    }

    // Calculate total remaining balance
    int totalOutstanding = 0;
    for (var c in allCustomers) {
      if (c['isPaid'] == false) {
        final amtText = c['amount']
            .toString()
            .replaceAll('৳', '')
            .replaceAll(',', '')
            .trim();
        final amt = int.tryParse(amtText) ?? 0;
        totalOutstanding += amt;
      }
    }

    final totalCountText = _toBengaliDigits(allCustomers.length.toString());
    final totalOutstandingText = _toBengaliDigits(totalOutstanding.toString());

    final filterChips = ['সব ($totalCountText)', 'বাকি আছে', 'ওভারডিউ', 'পরিশোধ'];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
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
                          'মোট $totalCountText জন • ৳$totalOutstandingText বাকি',
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
                CustomerSearchFlield(
                  controller: _searchController,
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val;
                    });
                  },
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 38.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filterChips.length,
                    itemBuilder: (context, index) {
                      final label = filterChips[index];
                      return CustomerClip(
                        label: label,
                        isSelected: _selectedChipIndex == index,
                        onTap: () {
                          setState(() {
                            _selectedChipIndex = index;
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: finalFiltered.isEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 32.h),
                            child: Center(
                              child: Text(
                                'কোনো গ্রাহক পাওয়া যায়নি',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF64748B),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: finalFiltered.length,
                            separatorBuilder: (context, index) => const Divider(
                              color: Color(0xFFF1F5F9),
                              height: 1,
                              thickness: 1,
                            ),
                            itemBuilder: (context, index) {
                              final customer = finalFiltered[index];
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
        onPressed: () {
          Get.to(() => const AddCustomerScreen());
        },
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
