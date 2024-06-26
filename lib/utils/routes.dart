import 'package:get/get.dart';
import 'package:pixbay/bindings/home_binding.dart';
import 'package:pixbay/screens/home_screen.dart';

class Routes {
  static const String home = '/home';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: Routes.home,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
  ];
}
