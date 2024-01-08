import 'package:flutter/material.dart';
import 'package:laraflutter/ui/layouts/app_bar.dart';
import 'package:laraflutter/ui/widgets/home/home_blog_widget.dart';
import 'package:laraflutter/ui/widgets/home/home_products_widget.dart';
import 'package:laraflutter/ui/widgets/home/home_reks_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const AppBarLayout(),
                  const HomeReksWidget(),
                    const  SizedBox(height: 20,),
                  HomeProductsWidget(),
                const  SizedBox(height: 20,),
                  HomeBlogsWidget()
                ],
              ),
            ),
          )),
    );
  }
}
