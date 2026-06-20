import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/common_wigdets/common_button.dart';
import 'package:tally_khata/common_wigdets/custom_textform_flield.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/widgets/add_remaining_header.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/widgets/add_remaining_profile_card.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/widgets/dotted_amount.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class AddCustomerReaminingScreen extends StatefulWidget {
  const AddCustomerReaminingScreen({super.key});

  @override
  State<AddCustomerReaminingScreen> createState() =>
      _AddCustomerReaminingScreenState();
}

class _AddCustomerReaminingScreenState extends State<AddCustomerReaminingScreen> {
  bool isGivingDue = true;
  int selectedPaymentMethodIndex = 0;

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _detailsController.dispose();
    _dateController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
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
                AddRemainingHeader(),
                UIHelper.verticalSpace(24.h),
                AddReamainingProfileCard(),
                UIHelper.verticalSpace(24.h),
                // ── Dotted Amount Area ──────────────────────────────────────
                DottedAmount(
                  isGivingDue: isGivingDue, 
                  amountController: _amountController,
                  ),

                UIHelper.verticalSpace(24.h),

                // ── Input Fields ────────────────────────────────────────────
          
                  CommonTextField(
                    controller: _detailsController,
                    labelText: 'পণ্যের বিবরণ',
                    hintText: 'চাল ৫ কেজি, ডাল ১ কেজি',
                    prefixIcon: Icons.inventory_2_outlined,
                  ),
                  UIHelper.verticalSpace(16.h),
                  CommonTextField(
                    controller: _dateController,
                    labelText: 'তারিখ',
                    hintText: '১৩ মে, ২০২৬',
                    prefixIcon: Icons.calendar_today_outlined,
                  ),
                  UIHelper.verticalSpace(16.h),
                  CommonTextField(
                    controller: _noteController,
                    labelText: 'নোট',
                    hintText: 'অতিরিক্ত তথ্য...',
                    prefixIcon: Icons.note_alt_outlined,
                    maxLines: 3,
                  ),
                  UIHelper.verticalSpace(32.h),
                  CommonButton(
                    text: 'বাকি সংরক্ষণ করুন',
                    onPressed: () {
                      // TODO: Handle save action
                    },
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }

  
}




