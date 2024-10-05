import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/user/user.dart';

class StorageService extends GetxService {
  String? languageCode;
  String? countryCode;
  String? deviceId;
  String? version;
  String? timezone = "Asia/Amman";
  String? appVersion = "1.0";

  Future<StorageService> init() async {
    await GetStorage.init();
    languageCode = GetStorage().read('languageCode');
    countryCode = GetStorage().read('countryCode');
    if (languageCode == null || languageCode == "") {
      languageCode = Get.deviceLocale!.languageCode;
      countryCode = Get.deviceLocale!.countryCode;
    }
    return this;
  }

  User? getUser() {
    if (GetStorage().read("user_ainalsaqer") != null) {
      return User.fromJson(GetStorage().read("user_ainalsaqer"));
    }
    return null;
  }
  String getLanguageCode() {
    if (GetStorage().read("languageCode") != null) {
      return GetStorage().read("languageCode");
    }
    return "ar";
    // return Get.deviceLocale?.languageCode == "ar" ||
    //         Get.deviceLocale?.languageCode == "en"
    //     ? Get.deviceLocale?.languageCode ?? "ar"
    //     : "ar";
  }

  String? getToken() {
    if (GetStorage().read("token_ainalsaqer") != null) {
      return GetStorage().read("token_ainalsaqer");
    }
    return null;
  }

  //
  void setUserToken(String value) {
    GetStorage().write("token_ainalsaqer", value);
  }

  bool isAuth() {
    if (GetStorage().read("token_ainalsaqer") != null &&
        GetStorage().read("user_ainalsaqer") != null) {
      return true;
    }
    return false;
  }

  void clearApp() {
    GetStorage().remove("user_ainalsaqer");
    GetStorage().remove("token_ainalsaqer");
  }

  void write(String key, dynamic value) {
    GetStorage().write(key, value);
  }

  bool isIntro() {
    if (GetStorage().read("is_intro_ainalsaqer") != null) {
      return GetStorage().read("is_intro_ainalsaqer");
    } else {
      return false;
    }
  }

  bool isLangFirst() {
    if (GetStorage().read("is_lang_first_ainalsaqer") != null) {
      return GetStorage().read("is_lang_first_ainalsaqer");
    } else {
      return false;
    }
  }

  void setIntro(bool isIntro) {
    GetStorage().write("is_intro_ainalsaqer", isIntro);
  }

  void setLangFirst(bool isLang) {
    GetStorage().write("is_lang_first_ainalsaqer", isLang);
  }

  void setUser(User value) {
    GetStorage().write(
        "user_ainalsaqer",
        User(
          name: value.name,
          acceptedLanguage: value.acceptedLanguage,
          licenseNo: value.licenseNo,
          ownerName: value.ownerName,
          ownerPhoneNumber: value.ownerPhoneNumber,
          phoneNumber: value.phoneNumber,
          tokenInfo: value.tokenInfo,
          truckNumber: value.truckNumber,
          email: value.email,
        ).toJson());
  }
}
