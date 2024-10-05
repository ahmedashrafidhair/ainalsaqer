import 'package:dio/dio.dart' as d;
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/translations/lang_keys.dart';
import '../../../app/util/ui_error_utils.dart';
import '../../../data/api/api_constant.dart';
import '../../../data/api/http_service.dart';
import '../../../data/models/user/user_model.dart';
import '../../base_controller.dart';

class SignInController extends BaseController {
  var obscureText = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> validation() async {
    if (email.text.isEmpty) {
      UiErrorUtils.customSnackbar(
          title: LangKeys.error.tr, msg: LangKeys.enterEmail.tr);
      return;
    }
    if (!GetUtils.isEmail(email.text.trim())) {
      UiErrorUtils.customSnackbar(
          title: LangKeys.error.tr, msg: LangKeys.emailNotValid.tr);
      return;
    }
    if (password.text.isEmpty) {
      UiErrorUtils.customSnackbar(
          title: LangKeys.error.tr, msg: LangKeys.enterPassword.tr);
      return;
    }

    login();
  }

  Future<void> login() async {
    // if (FcmHelper.fcmToken == null || FcmHelper.fcmToken == "") {
    //   await FirebaseMessaging.instance.getToken().then((token) {
    //     FcmHelper.fcmToken = token;
    //     if (kDebugMode) {
    //       print(token);
    //     }
    //   });
    // }
    try {
      Map<String, String> body = {
        "email": email.text,
        "password": password.text,
        // "firebase_token": FcmHelper.fcmToken ?? "",
      };
      EasyLoading.show();
      final result = await httpService.request(
          url: ApiConstant.login, method: Method.POST, params: body);
      if (result != null) {
        if (result is d.Response) {
          var data = UserModel.fromJson(result.data);
          if (data.errorCode == 0) {
            if (data.result != null && data.result?.tokenInfo != null) {}
            storage.setUserToken(data.result!.tokenInfo!.token!);
            storage.setUser(data.result!);
            Get.offAllNamed(AppRoutes.home);
          } else {
            UiErrorUtils.customSnackbar(
                title: LangKeys.error.tr, msg: data.errorMessage ?? "");
          }
        }
      }
    } finally {
      EasyLoading.dismiss(animation: true);
    }
  }

  Future<void> sendVerificationCode(String token) async {
    // try {
    //   EasyLoading.show();
    //   final result = await httpService.request(
    //       url: ApiConstant.resendOtp, method: Method.POST, token: token);
    //   if (result != null) {
    //     if (result is d.Response) {
    //       var data = GlobalModel.fromJson(result.data);
    //       if (data.status == 200) {
    //         UiErrorUtils.customSnackbar(
    //             title: LangKeys.success.tr, msg: data.message ?? "");
    //         Get.toNamed(AppRoutes.verificationCode, arguments: {
    //           "email": email.text,
    //           "token": token,
    //           "from": AppRoutes.signIn
    //         });
    //       } else {
    //         UiErrorUtils.customSnackbar(
    //             title: LangKeys.error.tr, msg: data.message ?? "");
    //       }
    //     }
    //   }
    // } finally {
    //   EasyLoading.dismiss(animation: true);
    // }
  }
}
