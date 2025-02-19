import 'dart:ui';
import 'package:archlelabsadmin/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'dart:io' show Platform;

import '../../constants.dart';
import '../../controllers/Authcontroller.dart';
import '../../theme/app_theme.dart';
import '../../utils/button.dart';
import '../../utils/loaders.dart';
import '../../utils/text_feilds.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final loginformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(  backgroundColor: const Color.fromARGB(255, 7, 6, 6),
      body: Responsive(mobile: _buildMobile(context), desktop: _buildDesktop(context),tablet: _buildDesktop(context)));
  }
 _buildDesktop(context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        constraints: BoxConstraints(minWidth: 100, maxWidth: 500),
        decoration: BoxDecoration(
          color:  bgColor,
          //   color: Color.fromARGB(70, 250, 220, 238),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(83, 48, 48, 48),
                spreadRadius: 2,
                offset: Offset(0, 0),
                blurRadius: 50)
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset(
              "assets/images/logo.png",
              height: 90,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Admin Login",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 18, color: AppTheme.whiteColor),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: _form(context)),
          ],
        ),
      ),
    );
  }

 
  _buildMobile(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric( vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              height: 90,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Admin Login",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 14, color: AppTheme.whiteColor),
          ),  SizedBox(
            height: 10,
          ),
          _form(context),
        ],
      ),
    );
  }

  _form(context) {
    return GetBuilder<AuthController>(builder: (_controller) {
      return Form(
        key: loginformKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextField(
                preicon: SvgPicture.asset("assets/images/mail.svg",
                    height: 10, fit: BoxFit.scaleDown),
                textEditingController: _controller.email,
                validation: (value) {
                  RegExp emailValidatorRegExp = RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  } else if (!emailValidatorRegExp.hasMatch(value.trim())) {
                    return 'Enter Valid email';
                  }
                  return null;
                },
                hintText: "Enter username",
                color: const Color(0xff585A60)),
            SizedBox(
              height: 20,
            ),
            MyTextField(
                isSuffixIcon: true,
                preicon: SvgPicture.asset("assets/images/lock.svg",
                    height: 5, width: 5, fit: BoxFit.scaleDown),
                textEditingController: _controller.password,
                obsecureText: !_controller.passwordLoginVisibility,
                ontapSuffix: () {
                  _controller.showPassword();
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
                hintText: 'Enter password',
                color: const Color(0xff585A60)),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Button(
                  tittle: "Log In",
                  tap: () {
               //     Loaders.errorSnackBar(message: "message", title: "hhff");
                    if (loginformKey.currentState!.validate()) {
                      //   Get.to(AiChatBot());
                      _controller.submit();
                    }
                  }),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    });
  }
}
