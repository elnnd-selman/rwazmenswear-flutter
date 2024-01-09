import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laraflutter/ui/layouts/app_bar.dart';
import 'package:laraflutter/ui/widgets/home/home_blogs_widget.dart';
import 'package:laraflutter/ui/widgets/home/home_offers_widget.dart';
import 'package:laraflutter/ui/widgets/home/home_products_widget.dart';
import 'package:laraflutter/ui/widgets/home/home_reks_widget.dart';

class HomeIndexPage extends StatelessWidget {
  const HomeIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(top: 20.w,bottom: 20.w),
              child: Column(
                children: [
                  const HomeReksWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeProductsWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeOffersWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeBlogsWidget()
                ],
              ),
            ),
          );
    
  }
}
