import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laraflutter/constant/images.dart';

class AppBarLayout extends StatelessWidget {
  const AppBarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      width: double.infinity,
      height: 75.w,
      decoration: BoxDecoration(color: Colors.grey.shade200,),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    AppImages.logo,
                  ),
                ),
                 SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RWAZ MENSWEAR',
                      style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),
                    ),
                     Text(
                      'Discover Elegance, Redefine Your Style.',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    
                  ],
                )
                 
              ],
            ),
             Icon(Icons.account_circle_outlined ,color: Colors.grey.shade400,)
          ],
        ),
      ),
    );
  }
}
