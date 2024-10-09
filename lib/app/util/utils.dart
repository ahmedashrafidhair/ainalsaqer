import 'dart:ui';

import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/app/extensions/color.dart';
import 'package:ainalsaqer/app/translations/lang_keys.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getIconPath(String name, {String format = 'svg'}) {
    return 'assets/icons/$name.$format';
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(launchUri)) {
      throw Exception('Could not launch $phoneNumber');
    }
  }

  static String dataChat(String data) {
    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(data);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('hh:mm');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String formatDate(String data, {String? format = "yyyy/MM/dd HH:mm"}) {
    return DateFormat(format).format(DateTime.parse(data));
  }

  static String orderType(int orderDateType) {
    String str = "";
    switch (orderDateType) {
      case 0:
        str = LangKeys.now.tr;
        break;
      case 1:
        str = LangKeys.schedule.tr;
        break;
    }
    return str;
  }

  static String serviceType(int serviceType) {
    String str = "";
    switch (serviceType) {
      case 0:
        str = LangKeys.pickUp.tr;
        break;
      case 1:
        str = LangKeys.deliver.tr;
        break;
      case 2:
        str = LangKeys.betweenBranches.tr;
        break;
      case 3:
        str = LangKeys.betweenCustomers.tr;
        break;
    }
    return str;
  }

  static Color getColorFromStatus(int orderStatus) {
    Color color = AppColors.primary;
    switch (orderStatus) {
      case 0:
        color = AppColors.primary;
        break;
      case 1:
        color = HexColor("20AE5C");
        break;
      case 2:
        color = HexColor("E40000");
        break;
    }
    return color;
  }

  static String orderStatus(int orderStatus) {
    String str = "";
    switch (orderStatus) {
      case 0:
        str = LangKeys.created.tr;
        break;
      case 1:
        str = LangKeys.modified.tr;
        break;
      case 2:
        str = LangKeys.booked.tr;
        break;
      case 3:
        str = LangKeys.inTransit.tr;
        break;
      case 4:
        str = LangKeys.pickedUpDone.tr;
        break;
      case 5:
        str = LangKeys.delivered.tr;
        break;
      case 6:
        str = LangKeys.deliveredWithPriceChanged.tr;
        break;
      case 7:
        str = LangKeys.deliveredWithLocationChanged.tr;
        break;
      case 8:
        str = LangKeys.cancelledByCustomer.tr;
        break;
      case 9:
        str = LangKeys.pending.tr;
        break;
      case 10:
        str = LangKeys.cancelled.tr;
        break;
      case 11:
        str = LangKeys.shipmente.tr;
        break;
      case 12:
        str = LangKeys.shipmenteApproved.tr;
        break;
      case 13:
        str = LangKeys.invoiceGenerated.tr;
        break;
      case 14:
        str = LangKeys.arriveToPickUpLocation.tr;
        break;
      case 15:
        str = LangKeys.arriveToDelivedLocation.tr;
        break;
    }
    return str;
  }

  static String getCurrentFormattedDate() {
    // Get the current date
    DateTime now = DateTime.now();

    // Format the date to MM/dd/yyyy
    String formattedDate = DateFormat('MM/dd/yyyy').format(now);

    return formattedDate;
  }
}
