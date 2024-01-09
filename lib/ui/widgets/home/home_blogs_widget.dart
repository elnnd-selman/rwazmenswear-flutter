import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laraflutter/application/controllers/home_controllers/home_controllers.dart';
import 'package:laraflutter/application/models/blog_model.dart';
import 'package:laraflutter/config/api.dart';

class HomeBlogsWidget extends StatelessWidget {
  HomeBlogsWidget({super.key});
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Text(
            'Latest Blogs',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Obx(
          () {
            List<BlogModel>? blogs = homeController.blogData.value.data;
            return blogs == null
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: 160.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: blogs.length,
                      itemBuilder: (context, index) => Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 400.w,
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 150.w,
                                      height: 220.w,
                                      child: Image.network(
                                        '${ApiConfig.baseUrlFile}storage/${blogs[index].image}',
                                        fit: BoxFit.cover,
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0.sp),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            blogs[index].nameEn!,
                                            maxLines: 2,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Text(
                                            blogs[index].contentEn!,
                                            maxLines: 2,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 14,
                                                color: Colors.grey.shade700,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(height: 10.w),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                DateFormat('dd-MM-yyyy').format(
                                                    blogs[index].createdAt!),
                                                maxLines: 2,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 10.sp,
                                                    color: Colors.grey.shade700,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.blue),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 5.w),
                                                  child: Text(
                                                    'Read more ...',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.sp),
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }
}
