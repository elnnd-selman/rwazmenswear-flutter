import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/home_controllers/home_controllers.dart';
import 'package:laraflutter/config/api.dart';

class HomeReksWidget extends StatefulWidget {
  const HomeReksWidget({
    super.key,
  });

  @override
  State<HomeReksWidget> createState() => _RekWidgetsState();
}

class _RekWidgetsState extends State<HomeReksWidget> {
  final CarouselController carouselController = CarouselController();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Obx(() {
      final List<Widget> imageSliders =
          homeController.rekData.value!.data == null
              ? []
              : homeController.rekData.value!.data!
                  .map((item) => ClipRRect(
                      borderRadius: BorderRadius.circular(10.sp),
                      child: Image.network(
                        '${ApiConfig.baseUrlFile}storage/${item.image}',
                        fit: BoxFit.cover,
                      )))
                  .toList();
      return Column(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0.sp,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                }),
            items: imageSliders,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageSliders.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: current == entry.key ? 36.0.w : 12.0.w,
                  height: 10.0.w,
                  margin:
                      EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 4.0.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.sp),
                      color: current != entry.key
                          ? Colors.grey.shade300
                          : Theme.of(context).primaryColor),
                ),
              );
            }).toList(),
          ),
        ],
      );
    });
  }
}
