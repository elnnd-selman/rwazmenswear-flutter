import 'package:get/get.dart';
import 'package:laraflutter/application/bindings/home_binding.dart';
import 'package:laraflutter/application/bindings/index_binding.dart';
import 'package:laraflutter/ui/pages/index_page.dart';

List<GetPage> appRoutes = [
  GetPage(
      name: '/',
      page: () => IndexPage(),
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 300),
      bindings: [IndexBinding(), HomeBinding()]),
];
