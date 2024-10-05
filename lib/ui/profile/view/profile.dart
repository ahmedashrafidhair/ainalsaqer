import 'package:ainalsaqer/app/components/custom_app_bar.dart';
import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/app/translations/lang_keys.dart';
import 'package:ainalsaqer/ui/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/components/custom_text.dart';
import 'widget/profile_detail.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        title: LangKeys.profile.tr,
        isShowBack: true,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35.r,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 50.r, color: Colors.white),
              ),
              16.verticalSpace,
              CustomText(
                text: controller.user?.name ?? "",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                height: 0,
                decoration: TextDecoration.underline,
                color: Colors.black,
              ),
              24.verticalSpace,
              ProfileDetail(
                title: LangKeys.phoneNumber.tr,
                value: controller.user?.phoneNumber ?? "",
              ),
              ProfileDetail(
                title: LangKeys.truckNumber.tr,
                value: controller.user?.truckNumber ?? "",
              ),
              ProfileDetail(
                title: LangKeys.licenseNo.tr,
                value: controller.user?.licenseNo ?? "",
              ),
              ProfileDetail(
                title: LangKeys.ownerName.tr,
                value: controller.user?.ownerName ?? "",
              ),
              ProfileDetail(
                title: LangKeys.ownerPhoneNumber.tr,
                value: controller.user?.ownerPhoneNumber ?? "",
                isLast: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
