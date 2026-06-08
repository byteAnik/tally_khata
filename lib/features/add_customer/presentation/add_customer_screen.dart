import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tally_khata/common_wigdets/common_button.dart';
import 'package:tally_khata/common_wigdets/custom_textform_flield.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';
import 'package:tally_khata/helpers/toast.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  File? _imageFile;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      ToastUtil.showShortToast('ছবি নির্বাচন করতে সমস্যা হয়েছে');
    }
  }

  void _showImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFCBD5E1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'ছবি যোগ করুন',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSourceOption(
                    icon: Icons.camera_alt_outlined,
                    label: 'ক্যামেরা',
                    color: const Color(0xFF10B981),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.camera);
                    },
                  ),
                  _buildSourceOption(
                    icon: Icons.photo_library_outlined,
                    label: 'গ্যালারি',
                    color: const Color(0xFF3B82F6),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSourceOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 64.w,
            width: 64.w,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 28.sp,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF475569),
            ),
          ),
        ],
      ),
    );
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

                // ── AppBar Row ──────────────────────────────────────────────
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16.sp,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'নতুন গ্রাহক',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),

                UIHelper.verticalSpace(28.h),

                // ── Photo Upload ────────────────────────────────────────────
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: _showImageSourceBottomSheet,
                            child: Container(
                              height: 88.w,
                              width: 88.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE7F8EF),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF10B981),
                                  width: 2,
                                ),
                              ),
                              child: _imageFile != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(44.w),
                                      child: Image.file(
                                        _imageFile!,
                                        width: 88.w,
                                        height: 88.w,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Center(
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 30.sp,
                                        color: const Color(0xFF10B981),
                                      ),
                                    ),
                            ),
                          ),
                          if (_imageFile != null)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _imageFile = null;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4.w),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    size: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        _imageFile != null ? 'ছবি পরিবর্তন করুন' : 'ছবি যোগ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF10B981),
                        ),
                      ),
                    ],
                  ),
                ),

                UIHelper.verticalSpace(28.h),

                // ── পূর্ণ নাম ──────────────────────────────────────────────
                CommonTextField(
                  controller: _nameController,
                  labelText: 'পূর্ণ নাম',
                  hintText: 'রহিম মিয়া',
                  prefixIcon: Icons.person_outline_rounded,
                ),

                UIHelper.verticalSpace(16.h),

                // ── ফোন নম্বর ──────────────────────────────────────────────
                CommonTextField(
                  controller: _phoneController,
                  labelText: 'ফোন নম্বর',
                  hintText: '+880 1712 345 678',
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                ),
                UIHelper.verticalSpace(16.h),
                CommonTextField(
                  controller: _addressController,
                  labelText: 'ঠিকানা',
                  hintText: 'মিরপুর ১০, ঢাকা',
                  prefixIcon: Icons.location_on_outlined,
                ),
                UIHelper.verticalSpace(16.h),
                CommonTextField(
                  controller: _amountController,
                  labelText: 'প্রারম্ভিক বাকি',
                  hintText: '৳ ০',
                  prefixIcon: Icons.currency_exchange_outlined,
                  keyboardType: TextInputType.number,
                ),

                UIHelper.verticalSpace(16.h),
                CommonTextField(
                  controller: _noteController,
                  labelText: 'নোট',
                  hintText: 'কোনো বিশেষ তথ্য...',
                  prefixIcon: Icons.note_outlined,
                  maxLines: 3,
                ),
                UIHelper.verticalSpace(32.h),

                // ── Submit Button ───────────────────────────────────────────
                CommonButton(
                  text: 'গ্রাহক সংরক্ষণ করুন',
                  onPressed: (){

                  },
                ),

                UIHelper.verticalSpace(24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
