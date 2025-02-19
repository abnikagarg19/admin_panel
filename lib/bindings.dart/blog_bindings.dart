import 'package:archlelabsadmin/controllers/Authcontroller.dart';
import 'package:archlelabsadmin/controllers/BlogController.dart';
import 'package:archlelabsadmin/controllers/menu_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/shared_pref.dart';

class BlogBindings extends Bindings {
  @override
 void dependencies() {
    
      Get.lazyPut<BlogController>(
      () => BlogController(),
    );
  }
}
