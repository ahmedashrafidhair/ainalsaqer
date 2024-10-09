import 'dart:io';

import 'package:ainalsaqer/data/models/expense/expense_model.dart';
import 'package:ainalsaqer/data/models/global_model.dart';
import 'package:ainalsaqer/ui/base_controller.dart';
import 'package:ainalsaqer/ui/home_page/controller/home_page_controller.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../app/translations/lang_keys.dart';
import '../../../app/util/ui_error_utils.dart';
import '../../../data/api/api_constant.dart';
import '../../../data/api/http_service.dart';
import '../../../data/models/expense/expense.dart';
import '../../../data/models/save_file/save_file.dart';
import '../../../data/models/save_file/save_file_model.dart';

class AddExpenseController extends BaseController {
  var expenseList = <Expense>[].obs;
  Rx<Expense> selectedExpense =
      Expense(name: LangKeys.selectTypeExpense.tr, id: "").obs;
  var isLoading = false.obs;

  final orderNumber = TextEditingController();
  final billNumber = TextEditingController();
  final value = TextEditingController();
  final notes = TextEditingController();
  File? imageFile;
  SaveFile? saveFile;

  @override
  onInit() {
    super.onInit();
    getAllExpense();
  }

  Future<void> getAllExpense() async {
    try {
      isLoading(true);
      final result = await httpService.request(
          url: ApiConstant.getAllExpense, method: Method.GET);
      if (result != null) {
        if (result is d.Response) {
          var resp = ExpenseModel.fromJson(result.data);
          expenseList.clear();
          if (resp.result != null && resp.result!.isNotEmpty) {
            expenseList.addAll(resp.result!);
          }
        }
      }
    } finally {
      isLoading(false);
      update(['selectedExpense']);
    }
  }

  Future<void> addDriverExpense() async {
    if (selectedExpense.value.id == "") {
      UiErrorUtils.customSnackbar(
          title: LangKeys.error.tr,
          msg: LangKeys.selectTypeExpense.tr);
      return;
    }
    if (saveFile == null) {
      UiErrorUtils.customSnackbar(
          title: LangKeys.error.tr, msg: LangKeys.attachPictureDocumentHere.tr);
      return;
    }
    try {
      Map<String, String> body = {
        "expenseId": selectedExpense.value.id ?? "",
        "orderNumber": orderNumber.text,
        "price": value.text,
        "billNumber": billNumber.text,
        "remarks": notes.text,
        "fileId": saveFile?.id ?? "",
      };
      EasyLoading.show();
      final result = await httpService.request(
          url: ApiConstant.addDriverExpense, method: Method.POST, params: body);
      if (result != null) {
        if (result is d.Response) {
          var data = GlobalModel.fromJson(result.data);
          if (data.errorCode == 0) {
            if (Get.isRegistered<HomePageController>()) {
              Get.find<HomePageController>().getHomePageStatistics();
            }
            Get.back();
            UiErrorUtils.customSnackbar(
                title: LangKeys.error.tr, msg: data.errorMessage ?? "");
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

  Future<void> updateFile() async {
    try {
      FocusScopeNode currentFocus = FocusScope.of(Get.context!);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.focusedChild?.unfocus();
      }
      EasyLoading.show();
      d.FormData? formData;
      String fileName = imageFile!.path.split('/').last;
      // var mimeType = lookupMimeType(image!.path);
      // mimeType ??= "image/png";
      // if (kDebugMode) {
      //   print("Log mimeType $mimeType");
      // }
      formData = d.FormData.fromMap({
        'file':
            await d.MultipartFile.fromFile(imageFile!.path, filename: fileName)
      });

      final result = await httpService.request(
        url: "${ApiConstant.saveFile}?fileKind=8",
        method: Method.POST,
        isUploadImg: true,
        formData: formData,
      );
      if (result != null) {
        if (result is d.Response) {
          var resp = SaveFileModel.fromJson(result.data);
          if (resp.errorCode == 0) {
            saveFile = resp.result;
            update(['selectImage']);
          } else {
            UiErrorUtils.customSnackbar(
                title: LangKeys.error.tr, msg: resp.errorMessage ?? "");
          }
        }
      }
    } finally {
      EasyLoading.dismiss(animation: true);
    }
  }

  Future<void> deleteFile() async {
    try {
      FocusScopeNode currentFocus = FocusScope.of(Get.context!);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.focusedChild?.unfocus();
      }
      EasyLoading.show();
      final result = await httpService.request(
        url: "${ApiConstant.deleteFile}?Id=${saveFile?.id ?? ""}",
        method: Method.DELETE,
      );
      if (result != null) {
        if (result is d.Response) {
          var resp = GlobalModel.fromJson(result.data);
          if (resp.errorCode == 0) {
            saveFile = null;
            update(['selectImage']);
          } else {
            UiErrorUtils.customSnackbar(
                title: LangKeys.error.tr, msg: resp.errorMessage ?? "");
          }
        }
      }
    } finally {
      EasyLoading.dismiss(animation: true);
    }
  }

  Future<void> selectImage() async {
    if (Platform.isAndroid) {
      final androidVersion = await DeviceInfoPlugin().androidInfo;
      if ((androidVersion.version.sdkInt) >= 33) {
        if (await Permission.camera.request().isGranted &&
            await Permission.photos.request().isGranted) {
          _showImageSourceSelection();
        } else {
          Map<Permission, PermissionStatus> statuses = await [
            Permission.storage,
            Permission.photos,
          ].request();
        }
      } else {
        if (await Permission.camera.request().isGranted &&
            await Permission.storage.request().isGranted) {
          _showImageSourceSelection();
        } else {
          Map<Permission, PermissionStatus> statuses = await [
            Permission.storage,
            Permission.camera,
          ].request();
        }
      }
    }
    if (Platform.isIOS) {
      _showImageSourceSelection();
    }
  }

  Future<void> _showImageSourceSelection() async {
    Get.bottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(16.w),
            topStart: Radius.circular(16.w),
          ),
        ),
        backgroundColor: Colors.white,
        SafeArea(
            child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera, size: 26.r),
              title: Text(LangKeys.takeAPhoto.tr),
              onTap: () async {
                Get.back();
                pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album, size: 26.r),
              title: Text(LangKeys.chooseFromGallery.tr),
              onTap: () async {
                Get.back();
                pickImage(ImageSource.gallery);
              },
            ),
          ],
        )));
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      updateFile();
    }
  }
}
