import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerPhotoPicker extends StatelessWidget {
  const CustomerPhotoPicker({
    super.key,
    required this.imageFile,
    required this.onPickImage,
    required this.onRemoveImage,
  });

  final File? imageFile;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: onPickImage,
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
                  child: imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(44.w),
                          child: Image.file(
                            imageFile!,
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

              if (imageFile != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: onRemoveImage,
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
            imageFile != null ? 'ছবি পরিবর্তন করুন' : 'ছবি যোগ',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF10B981),
            ),
          ),
        ],
      ),
    );
  }
}