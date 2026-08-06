import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class CommonTextFormField extends StatefulWidget {
  final String label;
  final FocusNode? focusNode;
  final String hintText;
  final bool obscureText;
  final bool isPassword;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final bool showCursor;
  final Function(String)? onChanged;

  const CommonTextFormField({
    super.key,
    required this.label,
    this.focusNode,
    required this.hintText,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.isPassword = false,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.maxLength,
    this.readOnly = false,
    this.onTap,
    this.showCursor = true,
    this.onChanged,
  });

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword ? true : widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔥 LABEL
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF475569),
          ),
        ),

        UIHelper.verticalSpace(8.h),

        /// 🔥 FIELD WRAPPER
        Container(
          height: widget.maxLines == 1 ? 55.h : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            gradient: LinearGradient(colors: [Colors.white, Colors.white]),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),

          child: TextFormField(
            focusNode: widget.focusNode,
            controller: widget.controller,

            /// 🔥 🔥 MAIN FIX
            textAlignVertical: widget.maxLines == 1
                ? TextAlignVertical.center
                : TextAlignVertical.top,

            obscureText: widget.isPassword ? _isObscured : widget.obscureText,

            keyboardType: widget.keyboardType,
            validator: widget.validator,
            onFieldSubmitted: widget.onFieldSubmitted,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            showCursor: widget.showCursor,
            onChanged: widget.onChanged,

            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF475569),
            ),

            decoration: InputDecoration(
              hintText: widget.hintText,

              hintStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF0F172A),
              ),

              /// 🔥 PERFECT CENTER BALANCE
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: widget.prefixIcon == null ? 14.w : 0,
              ),

              /// 🔥 PREFIX ICON
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: widget.prefixIcon,
                      ),
                    )
                  : null,

              prefixIconConstraints: BoxConstraints(minWidth: 40.w),

              /// 🔥 SUFFIX ICON (PASSWORD)
              suffixIcon:
                  widget.suffixIcon ??
                  (widget.isPassword
                      ? Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: IconButton(
                            icon: Icon(
                              _isObscured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFF64748B),
                              size: 18.sp,
                            ),
                            onPressed: _toggleVisibility,
                          ),
                        )
                      : null),

              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
