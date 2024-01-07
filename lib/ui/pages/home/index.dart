import 'package:flutter/material.dart';
import 'package:laraflutter/ui/layouts/app_bar.dart';
import 'package:laraflutter/ui/widgets/home/home_reks_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Column(
            children: [
              const AppBarLayout(),
              const HomeReksWidget()
              // Obx(
              //   () => homeController.productData.value!.products == null
              //       ? const CircularProgressIndicator()
              //       : GridView.builder(
              //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             childAspectRatio: 1 / 1.5, // Adjust this value for height
              //           ),
              //           itemCount: homeController.productData.value!.products!.length,
              //           itemBuilder: (context, index) {
              //             ProductModel product =
              //                 homeController.productData.value!.products![index];
              //             return Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Container(
              //                 padding: EdgeInsets.all(10),
              //                 decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.circular(10)),
              //                 child: Column(children: [
              //                   SizedBox(
              //                     height: 200,
              //                     child: Image.network(
              //                       product.images![0],
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                   Text(
              //                     product.title!,
              //                     maxLines: 1,
              //                   ),
              //                   Text(
              //                     product.description!,
              //                     maxLines: 2,
              //                   )
              //                 ]),
              //               ),
              //             );
              //           }),
              // ),
            ],
          )),
    );
  }
}
