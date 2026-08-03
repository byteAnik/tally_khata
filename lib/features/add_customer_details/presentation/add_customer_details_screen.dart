import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/features/add_customer_details/presentation/widgets/customer_action.dart'; 
import 'package:tally_khata/features/add_customer_details/presentation/widgets/top_header_section.dart';
import 'package:tally_khata/features/add_customer_details/presentation/widgets/transaction_history_section.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class AddCustomerDetailsScreen extends StatelessWidget {
  const AddCustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopHeaderSection(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                   CustomerAction(),
                  UIHelper.verticalSpace(28.h),
                   TransactionHistorySection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

