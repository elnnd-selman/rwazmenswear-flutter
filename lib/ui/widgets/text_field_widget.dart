import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final bool? obscureText;
  final bool? enabled;

  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onSave;
  final Function(String?)? onChange;

  final TextInputType? keyboardType;
  final Widget? label;
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.onSave,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.keyboardType,
    this.label,
    this.onChange,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: TextFormField(
          enabled: enabled,
          controller: controller,
          style: TextStyle(fontSize: 12.sp, color: Colors.black),
          obscureText: obscureText ?? false,
          keyboardType: keyboardType ?? TextInputType.text,
          onChanged: onChange,
          decoration: InputDecoration(
            label: label,
            contentPadding: EdgeInsets.all(20.w),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey.shade500),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
              borderSide: BorderSide(color: Colors.transparent, width: 2.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
              borderSide: BorderSide(color: Colors.transparent, width: 2.w),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
              borderSide: BorderSide(color: Colors.transparent, width: 2.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
              borderSide: BorderSide(color: Colors.transparent, width: 2.w),
            ),
          ),
          validator: validator,
          onSaved: onSave),
    );
  }
}
