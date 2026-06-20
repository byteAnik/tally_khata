import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/common_wigdets/common_button.dart';
import 'package:tally_khata/common_wigdets/custom_textform_flield.dart';
import 'package:tally_khata/constants/app_assets/assets_icons.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/widgets/add_remaining_profile_card.dart';
import 'package:tally_khata/features/add_remaining_amount/presentation/widgets/dotted_amount.dart';
import 'package:tally_khata/features/customer_details_flow/customer_payment_reamining/presentation/widgets/customer_payment_header.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class CustomerPaymentReaminingScreen extends StatefulWidget {
  const CustomerPaymentReaminingScreen({super.key});

  @override
  State<CustomerPaymentReaminingScreen> createState() =>
      _CustomerPaymentReaminingScreenState();
}

class _CustomerPaymentReaminingScreenState extends State<CustomerPaymentReaminingScreen> {
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
                CustomerPaymentHeader(),
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
              
                  Text(
                    'পেমেন্টের মাধ্যম',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF334155),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      _buildPaymentMethodOption(
                        index: 0,
                        icon: AssetsIcons.nagadIcon,
                        label: 'নগদ',
                      ),
                      SizedBox(width: 12.w),
                      _buildPaymentMethodOption(
                        index: 1,
                        icon: AssetsIcons.bKashIcon,
                        label: 'বিকাশ',
                      ),
                      SizedBox(width: 12.w),
                      _buildPaymentMethodOption(
                        index: 2,
                        icon: AssetsIcons.cardIcon,
                        label: 'কার্ড',
                      ),
                    ],
                  ),
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

             
              
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodOption({
    required int index,
    required String icon,
    required String label,
  }) {
    final isSelected = selectedPaymentMethodIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedPaymentMethodIndex = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF10B981).withOpacity(0.05)
                : Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF10B981)
                  : const Color(0xFFE2E8F0),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                icon,
                height: 35.sp,
                width: 35.sp,
              ),
              SizedBox(height: 8.h),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? const Color(0xFF10B981)
                      : const Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




