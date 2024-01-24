import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/constant/colors.dart';

class PageNavbarLayout extends StatelessWidget {
  final Function()? onBackTab;
  final String title;
  final double? titleFontSize;
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
      this.actionIsLoading,
      this.titleFontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
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
              Expanded(
                child: Text(
                  
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize ?? 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                    overflow: TextOverflow.ellipsis
                  ),
                  maxLines: 1,

                ),
              ),
            ],
          ),
        ),
        buildActionWidget()
      ],
    );
  }

  Widget buildActionWidget() {
    // If there are actions and the list is not empty
    if (actions?.isNotEmpty == true) {
      return Row(children: actions!);
    }

    // If actionTitle is not null and actionIsLoading is not true
    if (actionTitle != null && !(actionIsLoading ?? false)) {
      return InkWell(
        onTap: onActionTab,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(7.sp),
          ),
          child: Text(
            actionTitle!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    // If actionIsLoading is true
    if (actionIsLoading == true) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(7.sp),
        ),
        child: const CircularProgressIndicator(color: Colors.white),
      );
    }

    // Default case when there are no actions and actionTitle is null
    return const SizedBox();
  }
}
