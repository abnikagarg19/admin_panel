import 'dart:async';
import 'package:archlelabsadmin/services/shared_pref.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class SplashController extends GetxController {
  SplashController();
  final image = "assets/images/logo.png";

  @override
  void onReady() {
    super.onReady();
   
    Timer(const Duration(seconds: 2), () {
      if (PreferenceUtils.isLoggedIn()) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
    // }
  }
}
