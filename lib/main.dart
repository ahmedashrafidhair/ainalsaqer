import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/binding/initial_binding.dart';
import 'app/config/app_colors.dart';
import 'app/config/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/services/storage_service.dart';
import 'app/translations/app_translations.dart';
import 'data/api/http_service.dart';
import 'ui/splash/view/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // FcmHelper.initFcm();
  // if (Platform.isIOS) {
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform, name: "arab-zawaj");
  // } else {
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform);
  // }

  await initServices();
  runApp(MyApp());
  // Eraser.resetBadgeCountAndRemoveNotificationsFromCenter();
  configLoading();
}

Future<void> initServices() async {
  await Get.putAsync<StorageService>(() => StorageService().init());
  await Get.putAsync<HttpService>(() => HttpService().init());
}

void configLoading() {
  EasyLoading.instance
    // ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..progressColor = Colors.yellow
    ..backgroundColor = AppColors.primary
    ..indicatorColor = Colors.white
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.4)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final storage = Get.find<StorageService>();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (x, y) => GetMaterialApp(
        // ignore: unnecessary_null_comparison
        translations: AppTranslations(),
        locale: Locale(storage.getLanguageCode()),
        fallbackLocale: Locale(storage.getLanguageCode()),
        initialBinding: InitialBinding(),
        initialRoute: AppRoutes.splash,
        getPages: appPages,
        defaultTransition: Transition.cupertino,
        builder: EasyLoading.init(),
        theme: lightTheme,
        darkTheme: lightTheme,
        home: Splash(),
        debugShowCheckedModeBanner: false,
        title: 'Ain Al Saqer',
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if (state == AppLifecycleState.resumed) {
    //   Eraser.resetBadgeCountAndRemoveNotificationsFromCenter();
    //   if(Get.isRegistered<HomeController>()){
    //     if(Get.find<HomeController>().currentIndex.value == 2){
    //       Get.find<PublicController>().updateUserFirebase(true);
    //     }
    //   }
    // } else {
    //   Get.find<PublicController>().updateUserFirebase(false);
    // }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
