import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/controllers/add_remaining_amount_controller.dart';
import 'package:tally_khata/common_wigdets/common_button.dart';
import 'package:tally_khata/common_wigdets/custom_textform_flield.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/widgets/add_remaining_header.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/widgets/add_remaining_profile_card.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/widgets/dotted_amount.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/widgets/payment_method_option.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/widgets/transaction_type_toggle.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class AddRemainingAmountScreen extends StatefulWidget {
  const AddRemainingAmountScreen({super.key});

  @override
  State<AddRemainingAmountScreen> createState() =>
      _AddRemainingAmountScreenState();
}

class _AddRemainingAmountScreenState extends State<AddRemainingAmountScreen> {
  final AddRemainingAmountController controller = Get.put(AddRemainingAmountController());
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

                const TransactionTypeToggle(),
                UIHelper.verticalSpace(24.h),

                // ── Dotted Amount Area ──────────────────────────────────────
                Obx(() {
                  final isGivingDue = controller.isGivingDue.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DottedAmount(
                        isGivingDue: isGivingDue,
                        amountController: _amountController,
                      ),
                      UIHelper.verticalSpace(24.h),

                      // ── Input Fields ────────────────────────────────────────────
                if (isGivingDue) ...[
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
                ] else ...[
                  Text(
                    'পেমেন্টের মাধ্যম',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF334155),
                    ),
                  ),
                  SizedBox(height: 8.h),
                   PaymentMethodOption(),
                  UIHelper.verticalSpace(16.h),
                  CommonTextField(
                    controller: _noteController,
                    labelText: 'নোট',
                    hintText: 'পেমেন্টের বিবরণ...',
                    prefixIcon: Icons.description_outlined,
                  ),
                  UIHelper.verticalSpace(32.h),
                  CommonButton(
                    text: 'পেমেন্ট নিশ্চিত করুন',
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      // TODO: Handle save action
                    },
                  ),
                ],

                      UIHelper.verticalSpace(24.h),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
