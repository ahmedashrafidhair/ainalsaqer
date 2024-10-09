import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../base_controller.dart';
import '../../home_page/view/home_page.dart';
import '../../my_orders/view/my_orders.dart';
import '../../settings/view/settings_page.dart';

class HomeController extends BaseController {
  var currentIndex = 0.obs;
  var notCount = 0.obs;

  List<Widget> screens = [
    HomePage(),
    MyOrders(),
    HomePage(),
    SettingsPage(),
  ];
}
