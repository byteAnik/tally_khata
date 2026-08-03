import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tally_khata/features/add_customer/presentation/widgets/source_option.dart';

class CustomerImageSourceBottomSheet extends StatelessWidget {
  const CustomerImageSourceBottomSheet({
    super.key,
    required this.onImageSelected,
  });

  final Function(ImageSource source) onImageSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 28,
      ),
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
              SourceOption(
                icon: Icons.camera_alt_outlined,
                label: 'ক্যামেরা',
                color: const Color(0xFF10B981),
                onTap: () {
                  Navigator.pop(context);
                  onImageSelected(ImageSource.camera);
                },
              ),
              SourceOption(
                icon: Icons.photo_library_outlined,
                label: 'গ্যালারি',
                color: const Color(0xFF3B82F6),
                onTap: () {
                  Navigator.pop(context);
                  onImageSelected(ImageSource.gallery);
                },
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

