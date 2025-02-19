import 'package:archlelabsadmin/controllers/Authcontroller.dart';
import 'package:archlelabsadmin/controllers/BlogController.dart';
import 'package:archlelabsadmin/controllers/menu_app_controller.dart';
import 'package:archlelabsadmin/controllers/teamController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/shared_pref.dart';

class TeamBindings extends Bindings {
  @override
 void dependencies() {
    
      Get.lazyPut<TeamController>(
      () => TeamController(),
    );
  }
}
