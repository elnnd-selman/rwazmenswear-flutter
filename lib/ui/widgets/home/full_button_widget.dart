import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laraflutter/constant/colors.dart';


class FullButtonWidget extends StatelessWidget {
  const FullButtonWidget(
      {super.key, required this.onTab, required this.child, this.raduis});
  final void Function() onTab;
  final Widget child;
  final double? raduis;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.w),
      child: InkWell(
        onTap: onTab,
        child: Container(
          width: double.infinity,
          height: 55.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(raduis ?? 15.w),
              color: AppColors.primary),
          child: Center(child: child),
        ),
      ),
    );
  }
}