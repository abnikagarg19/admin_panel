import 'package:archlelabsadmin/controllers/Authcontroller.dart';
import 'package:archlelabsadmin/controllers/menu_app_controller.dart';
import 'package:archlelabsadmin/controllers/splashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/shared_pref.dart';

class DependencyInjection {
  static void init() async {
    await PreferenceUtils.init();
     Get.lazyPut<AuthController>(
      () => AuthController(),
    );
      Get.lazyPut<SplashController>(
      () => SplashController(),
    );
      Get.lazyPut<MenuAppController>(
      () => MenuAppController(),
    );
  }
}
