import 'package:ainalsaqer/data/models/user/user.dart';
import 'package:ainalsaqer/ui/base_controller.dart';

class ProfileController extends BaseController {
  User? user;

  @override
  onInit() {
    super.onInit();
    user = storage.getUser();
  }
}
