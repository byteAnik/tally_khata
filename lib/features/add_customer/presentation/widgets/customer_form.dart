import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/common_wigdets/custom_textform_flield.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class CustomerForm extends StatelessWidget {
  const CustomerForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.amountController,
    required this.noteController,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController amountController;
  final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// ── পূর্ণ নাম ──────────────────────────────────────────────
        CommonTextField(
          controller: nameController,
          labelText: 'পূর্ণ নাম',
          hintText: 'রহিম মিয়া',
          prefixIcon: Icons.person_outline_rounded,
        ),

        UIHelper.verticalSpace(16.h),

        /// ── ফোন নম্বর ──────────────────────────────────────────────
        CommonTextField(
          controller: phoneController,
          labelText: 'ফোন নম্বর',
          hintText: '+880 1712 345 678',
          prefixIcon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),

        UIHelper.verticalSpace(16.h),

        /// ── ঠিকানা ────────────────────────────────────────────────
        CommonTextField(
          controller: addressController,
          labelText: 'ঠিকানা',
          hintText: 'মিরপুর ১০, ঢাকা',
          prefixIcon: Icons.location_on_outlined,
        ),

        UIHelper.verticalSpace(16.h),

        /// ── প্রারম্ভিক বাকি ───────────────────────────────────────
        CommonTextField(
          controller: amountController,
          labelText: 'প্রারম্ভিক বাকি',
          hintText: '৳ ০',
          prefixIcon: Icons.currency_exchange_outlined,
          keyboardType: TextInputType.number,
        ),

        UIHelper.verticalSpace(16.h),

        /// ── নোট ───────────────────────────────────────────────────
        CommonTextField(
          controller: noteController,
          labelText: 'নোট',
          hintText: 'কোনো বিশেষ তথ্য...',
          prefixIcon: Icons.note_outlined,
          maxLines: 3,
        ),
      ],
    );
  }
}