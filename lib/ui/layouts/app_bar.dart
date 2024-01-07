import 'package:flutter/material.dart';
import 'package:laraflutter/constant/images.dart';

class AppBarLayout extends StatelessWidget {
  const AppBarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 15),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                const SizedBox(
                  width: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'RWAZ MENSWEAR',
                      style: TextStyle(fontSize: 12),
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
