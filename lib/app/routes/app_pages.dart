import 'package:get/get.dart';

import '../../ui/sign_in/view/sign_in.dart';
import '../../ui/splash/view/splash.dart';
import 'app_routes.dart';

final appPages = [
  GetPage(name: AppRoutes.splash, page: () => const Splash()),
  // GetPage(name: AppRoutes.onBoarding, page: () => OnBoarding()),
  GetPage(name: AppRoutes.signIn, page: () => SignIn()),
];
