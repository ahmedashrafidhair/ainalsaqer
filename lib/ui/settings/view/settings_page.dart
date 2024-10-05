import 'package:ainalsaqer/app/components/custom_app_bar.dart';
import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/app/extensions/color.dart';
import 'package:ainalsaqer/app/routes/app_routes.dart';
import 'package:ainalsaqer/app/translations/lang_keys.dart';
import 'package:ainalsaqer/ui/settings/controller/settings_page_controller.dart';
import 'package:ainalsaqer/ui/settings/view/widget/item_settings.dart';
import 'package:ainalsaqer/ui/settings/view/widget/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/settings_model.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  SettingsPageController controller = Get.put(SettingsPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: LangKeys.settings.tr),
      body: Column(
        children: [
          ProfileHeader(
            name: controller.user?.name ?? "",
            email: controller.user?.email ?? "",
            profileImage:
                "assets/profile.jpg", // Replace with a network image URL if needed
          ),
          Expanded(
            child: ListView(
              children: [
                ItemSettings(
                  item: SettingsModel(
                    icon: "ic_user",
                    title: LangKeys.profile.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.profile);

                      // Navigate to Profile Screen
                    },
                  ),
                ),
                ItemSettings(
                  item: SettingsModel(
                    icon: "ic_lang",
                    title: LangKeys.language.tr,
                    onTap: () {
                      // Navigate to Profile Screen
                    },
                  ),
                ),
                ItemSettings(
                  item: SettingsModel(
                    icon: "ic_eye",
                    title: LangKeys.changePassword.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.changePassword);
                    },
                  ),
                ),
                ItemSettings(
                  item: SettingsModel(
                    icon: "ic_privcey",
                    title: LangKeys.privacyPolicy.tr,
                    onTap: () {
                      // Navigate to Profile Screen
                    },
                  ),
                ),
                ItemSettings(
                  item: SettingsModel(
                    icon: "about_us",
                    title: LangKeys.aboutUs.tr,
                    onTap: () {
                      // Navigate to Profile Screen
                    },
                  ),
                ),
                ItemSettings(
                  item: SettingsModel(
                    icon: "ic_contact_us",
                    title: LangKeys.contactUs.tr,
                    onTap: () {
                      // Navigate to Profile Screen
                    },
                  ),
                ),
                ItemSettings(
                  item: SettingsModel(
                    icon: "ic_log_out",
                    title: LangKeys.logOut.tr,
                    textColor: HexColor("D52020"),
                    isLast: true,
                    onTap: () {
                      // Navigate to Profile Screen
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
