import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/components/loading_view.dart';
import '../../../app/components/primary_button.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/config/app_text_styles.dart';
import '../../../app/translations/lang_keys.dart';
import '../../../app/util/utils.dart';
import '../controller/splash_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashController controller = Get.put(SplashController());

  // @override
  // void initState() {
  //   super.initState();
  //   controller.checkAuth();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: LoadingView(),
          );
        } else if (!controller.hasInternet.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Utils.getIconPath("no_internet"),
                    width: 80.w, height: 80.h),
                22.verticalSpace,
                Text(
                  LangKeys.notInternetConnection.tr,
                  style: AppTextStyles.mediumTextStyle
                      .copyWith(color: AppColors.primary, fontSize: 15.0.sp),
                ),
                22.verticalSpace,
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 40.w),
                  child: PrimaryButton(
                    width: ScreenUtil().screenWidth,
                    onPressed: () {
                      controller.retryConnection();
                    },
                    height: 47.0.h,
                    borderRadius: BorderRadius.circular(6.0.r),
                    child: Text(LangKeys.retry.tr,
                        style: AppTextStyles.semiBoldTextStyle
                            .copyWith(color: Colors.white, fontSize: 16.sp)),
                  ),
                ),
              ],
            ),
          );
        } else {
          controller.checkAuth();
          return Center(
            child: Animate(
              effects: const [FadeEffect(), ScaleEffect()],
              delay: 1300.ms,
              child: SvgPicture.asset(Utils.getIconPath("ic_logo_sp"),
                  width: 153.w, height: 153.h),
            ),
          ); // Empty screen while navigating
        }
      }),
    );
  }
}
