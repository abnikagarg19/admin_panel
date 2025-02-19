import 'package:archlelabsadmin/controllers/Authcontroller.dart';
import 'package:archlelabsadmin/controllers/BlogController.dart';
import 'package:archlelabsadmin/controllers/designationController.dart';
import 'package:archlelabsadmin/controllers/menu_app_controller.dart';
import 'package:archlelabsadmin/controllers/teamController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/shared_pref.dart';

class DesignationBindings extends Bindings {
  @override
 void dependencies() {
    
      Get.lazyPut<DesignationController>(
      () => DesignationController(),
    );
  }
}
