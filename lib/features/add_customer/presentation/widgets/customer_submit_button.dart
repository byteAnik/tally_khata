import 'package:flutter/material.dart';
import 'package:tally_khata/common_wigdets/common_button.dart';

class CustomerSubmitButton extends StatelessWidget {
  const CustomerSubmitButton({
    super.key,
    required this.onPressed,
    this.text = 'গ্রাহক সংরক্ষণ করুন',
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      text: text,
      onPressed: onPressed,
    );
  }
}