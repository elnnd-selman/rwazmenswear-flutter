import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/home_controllers/home_controllers.dart';
import 'package:laraflutter/application/models/offer_model.dart';
import 'package:laraflutter/config/api.dart';

class HomeOffersWidget extends StatelessWidget {
  HomeOffersWidget({super.key});
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeController.offerData.value.data == null
          ? const CircularProgressIndicator()
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: homeController.offerData.value.data!.length,
              itemBuilder: (context, index) {
                OfferModel offer = homeController.offerData.value.data![index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5.w),
                  width: double.infinity,
                  height: 150.w,
                  decoration: BoxDecoration(color: Colors.grey.shade900),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offer.nameEn!,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white),
                                maxLines: 2,
                              ),
                              Text(
                                offer.contentEn!,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey.shade300),
                                maxLines: 2,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.dialog(Scaffold(
                                    body: Container(
                                      decoration:
                                          // ignore: prefer_const_constructors
                                          BoxDecoration(color: Colors.white),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: EdgeInsets.all(20.0.w),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      icon:
                                                          const Icon(Icons.close))
                                                ],
                                              ),
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.sp),
                                                  child: Image.network(
                                                    '${ApiConfig.baseUrlFile}/storage/${offer.image!}',
                                                  )),
                                                    SizedBox(
                                                height: 20.w,
                                              ),
                                              Text(
                                                offer.nameEn!,
                                                style:  TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.w),
                                              ),
                                              SizedBox(
                                                height: 20.w,
                                              ),
                                              Text(
                                                offer.contentEn!,
                                                style: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 14.w),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(7.w),
                                  decoration:
                                      const BoxDecoration(color: Colors.amber),
                                  child: Text(
                                    'Read More',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey.shade900),
                                    maxLines: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.network(
                            '${ApiConfig.baseUrlFile}storage/${offer.image!}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
