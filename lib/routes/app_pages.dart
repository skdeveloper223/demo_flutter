import 'package:get/get.dart';

import '../screens/splashscreen/splash_binding.dart';
import '../screens/splashscreen/splash_screen.dart';

class AppPages {
  static var list = [
    GetPage(name: SplashScreen.routes, page: () => const SplashScreen(), binding: SplashBinding()),
  ];
}
