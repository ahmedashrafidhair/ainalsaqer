import 'package:get/get.dart';

import '../../ui/add_expense/view/add_expense.dart';
import '../../ui/change_password/view/change_password.dart';
import '../../ui/expenses/view/driver_expenses.dart';
import '../../ui/home/view/home.dart';
import '../../ui/order_details/view/order_details.dart';
import '../../ui/profile/view/profile.dart';
import '../../ui/sign_in/view/sign_in.dart';
import '../../ui/splash/view/splash.dart';
import 'app_routes.dart';

final appPages = [
  GetPage(name: AppRoutes.splash, page: () => const Splash()),
  // GetPage(name: AppRoutes.onBoarding, page: () => OnBoarding()),
  GetPage(name: AppRoutes.signIn, page: () => SignIn()),
  GetPage(name: AppRoutes.home, page: () => Home()),
  GetPage(name: AppRoutes.profile, page: () => Profile()),
  GetPage(name: AppRoutes.changePassword, page: () => ChangePassword()),
  GetPage(name: AppRoutes.driverExpenses, page: () => Expenses()),
  GetPage(name: AppRoutes.addExpense, page: () => AddExpense()),
  GetPage(name: AppRoutes.orderDetails, page: () => OrderDetails()),
];
