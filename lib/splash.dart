import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/splashController.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(58.0),
        child: Image.asset(
          controller.image,
          height: 70,
        ),
      )),
    );
  }
}
