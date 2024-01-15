import 'package:get/get.dart';
import 'package:laraflutter/application/bindings/auth_binding.dart';
import 'package:laraflutter/application/bindings/home_binding.dart';
import 'package:laraflutter/application/bindings/index_binding.dart';
import 'package:laraflutter/application/bindings/product_binding.dart';
import 'package:laraflutter/ui/pages/auth/login_index_page.dart';
import 'package:laraflutter/ui/pages/index_page.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: '/index',
    page: () => IndexPage(),
    transition: Transition.size,
    transitionDuration: const Duration(milliseconds: 300),
    bindings: [
      HomeBinding(),
      ProductBinding(),
      IndexBinding(),
    ],
  ),
  GetPage(
    name: '/',
    page: () => LoginIndexPage(),
    transition: Transition.size,
    transitionDuration: const Duration(milliseconds: 300),
    bindings: [AuthBinding()],
  ),
];
