import 'package:application/app/ApplicationStyle/ImageRessources.dart';
import 'package:application/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (() {
      Get.offAllNamed(Routes.READY);
    }));
    return Scaffold(
      body: Center(
          child: Container(
                height: 300,
                width: 300,
                child: CustomImage(
                  imagePath:
                      'assets/Images/codecraft.png', // Remplacez par le chemin de votre image
                ),
              ),
      ),
    );
  }
}
