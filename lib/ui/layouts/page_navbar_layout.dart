import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/constant/colors.dart';

class PageNavbarLayout extends StatelessWidget {
  final Function()? onBackTab;
  final String title;

  final Function()? onActionTab;
  final List<Widget>? actions;
  final String? actionTitle;
  final bool? actionIsLoading;

  const PageNavbarLayout(
      {super.key,
      this.onBackTab,
      required this.title,
      this.onActionTab,
      this.actions,
      this.actionTitle,
      this.actionIsLoading});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: onBackTab ??
                    () {
                      Get.back();
                    },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey.shade900,
                )),
            SizedBox(
              width: 20.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900,
              ),
            ),
          ],
        ),
        actionTitle == null
            ? const SizedBox()
            : InkWell(
                onTap: actionIsLoading != null && actionIsLoading!
                    ? null
                    : onActionTab,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(7.sp)),
                  child: actionIsLoading != null && actionIsLoading!
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Row(
                          children: [
                            Text(
                              actionTitle!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                ),
              )
      ],
    );
  }
}
