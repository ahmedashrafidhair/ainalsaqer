import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../base_controller.dart';

class SplashController extends BaseController {
  var hasInternet = false.obs; // Observable for internet status
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkInternetConnection();
  }

  void checkAuth() async {
    // await FcmHelper.initFcm();
    Future.delayed(const Duration(seconds: 3), () {
      if (storage.isIntro()) {
        if (storage.getToken() != null) {
          // Get.offAllNamed(AppRoutes.home);
        } else {
          Get.offAllNamed(AppRoutes.signIn);
        }
      } else {
        Get.offAllNamed(AppRoutes.signIn);
      }
    });
  }

  Future<void> checkInternetConnection() async {
    isLoading.value = true; // Show splash screen
    final connectivityResults = await Connectivity().checkConnectivity();
    // Check if any result in the list indicates a connected state
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      hasInternet.value = true;
    } else {
      hasInternet.value = false;
    }

    isLoading.value = false; // Hide splash screen when done
  }

  void retryConnection() {
    checkInternetConnection(); // Retry internet check
  }
}
