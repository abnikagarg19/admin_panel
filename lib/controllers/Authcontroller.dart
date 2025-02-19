import 'dart:convert';
import 'package:archlelabsadmin/services/auth_repo.dart';
import 'package:archlelabsadmin/utils/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../services/shared_pref.dart';

class AuthController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final emailForget = TextEditingController();
  final Resetpassword = TextEditingController();
  final ResetpasswordConfirm = TextEditingController();
  bool isRemember = false;
  var passwordLoginVisibility = false;
  void showPassword() {
    passwordLoginVisibility = !passwordLoginVisibility;
    update();
  }

  //final service = AuthService();

  void submit() async {
    Loaders.showLoading('Loading...');
    AuthRepo().login(email.text, password.text).then((value) {
      print(value!.statusCode);
      Loaders.hideLoading();
      switch (value.statusCode) {
        case 200:
          var data2 = jsonDecode(value.body);

          PreferenceUtils.saveUserToken(data2["access_token"]);
            PreferenceUtils.setString("name", data2["data"]["name"]);

          Get.offAllNamed(
            Routes.home,
          );
          break;
        case 400:
          // if (value.data["detail"] == "User is not verified") {
          //   DialogHelper.showErroDialog(
          //       description: "your email not registered with us");
          //   // Get.toNamed(
          //   //   Routes.SIGNUP,
          //   // );
          // }
          Loaders.errorSnackBar(
              message: "Username and password is wrong",
              title: "Invalid Credentials");

          break;
        case 401:
          Loaders.errorSnackBar(
              message: "Username and password is wrong",
              title: "Invalid Credentials");
          break;

        case 1:
          break;
        default:
          Loaders.errorSnackBar(
              message: "Username and password is wrong",
              title: "Invalid Credentials");
          break;
      }
    });
  }
}
