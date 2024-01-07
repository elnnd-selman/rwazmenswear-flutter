import 'package:get/get.dart';
import 'package:laraflutter/application/bindings/home_binding.dart';
import 'package:laraflutter/ui/pages/home/index.dart';

List<GetPage> appRoutes = [
  GetPage(
      name: '/',
      page: () => HomePage(),
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 300),
      bindings: [HomeBinding()]),
];
