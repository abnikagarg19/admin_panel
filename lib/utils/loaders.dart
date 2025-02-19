import 'package:archlelabsadmin/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class Loaders {
  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        width: 500,
        elevation: 0,
        behavior: SnackBarBehavior.fixed,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color:  AppTheme.textBlackColor.withOpacity(0.5),
          ),
          child: Center(child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
static void showLoading([String? message]) {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(50)),
            width: 60,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CupertinoActivityIndicator(
                color: AppTheme.primaryColor,
                radius: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  static successSnackBar({required title, message = '', duration = 1}) {
    Get.snackbar(
      title,
      message,
      maxWidth: 600,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor:  AppTheme.primaryColor,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon:  Icon(Icons.check, color: AppTheme.whiteColor),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      maxWidth: 600,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: AppTheme.whiteColor,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon:  Icon(Icons.warning, color: AppTheme.whiteColor),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      maxWidth: 600,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: AppTheme.whiteColor,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: Icon(Icons.warning, color: AppTheme.whiteColor),
    );
  }
}
