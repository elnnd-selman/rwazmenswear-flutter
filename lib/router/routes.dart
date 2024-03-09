import 'package:get/get.dart';
import 'package:laraflutter/application/bindings/auth_binding.dart';
import 'package:laraflutter/application/bindings/cart_binding.dart';
import 'package:laraflutter/application/bindings/home_binding.dart';
import 'package:laraflutter/application/bindings/index_binding.dart';
import 'package:laraflutter/application/bindings/product_binding.dart';
import 'package:laraflutter/application/bindings/user_binding.dart';
import 'package:laraflutter/application/middleware/auth_middleware.dart';
import 'package:laraflutter/ui/pages/auth/forgot_password_index.dart';
import 'package:laraflutter/ui/pages/auth/login_index_page.dart';
import 'package:laraflutter/ui/pages/auth/register_index_page.dart';
import 'package:laraflutter/ui/pages/cart/cart_index_page.dart';
import 'package:laraflutter/ui/pages/index_page.dart';
import 'package:laraflutter/ui/pages/products/product_show_index_page.dart';
import 'package:laraflutter/ui/pages/users/profile_index_page.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: '/',
    page: () => IndexPage(),
    transition: Transition.size,
    transitionDuration: const Duration(milliseconds: 300),
    bindings: [
            CartBinding(),

      HomeBinding(),
      ProductBinding(),
      IndexBinding(),
      CartBinding(),
    ],
  ),
  GetPage(
    name: '/login',
    page: () => const LoginIndexPage(),
    transition: Transition.size,
    transitionDuration: const Duration(milliseconds: 300),
    bindings: [AuthBinding()],
  ),
  GetPage(
    name: '/register',
    page: () => const RegisterIndexPage(),
    transition: Transition.size,
    transitionDuration: const Duration(milliseconds: 300),
    bindings: [AuthBinding()],
  ),
  GetPage(
    name: '/profile',
    page: () => const ProfileIndexPage(),
    transition: Transition.size,
    transitionDuration: const Duration(milliseconds: 300),
    bindings: [UserBinding()],
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: '/forgot_password',
    page: () => const ForgotPasswordIndexPage(),
    transition: Transition.size,
    transitionDuration: const Duration(milliseconds: 300),
    bindings: [AuthBinding()],
  ),
  GetPage(
    name: '/product_show',
    page: () => const ProductsShowIndexPage(),
    transition: Transition.size,
    transitionDuration: const Duration(milliseconds: 300),
    bindings: [ProductBinding()],
  ),
  GetPage(
    name: '/cart',
    page: () => const CartIndexPage(),
    transition: Transition.size,
    transitionDuration: const Duration(milliseconds: 300),
    bindings: [],
  ),
];
