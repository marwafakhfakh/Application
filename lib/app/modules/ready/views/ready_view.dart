import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/ImageRessources.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/modules/login/bindings/login_binding.dart';
import 'package:application/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ready_controller.dart';

class ReadyView extends GetView<ReadyController> {
  const ReadyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.PrimaryColorLight,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 80),
              child: Container(
                height: 500,
                width: 300,
                child: 
                CustomImage (
               
                  imagePath:
                      'assets/Images/ready.png', // Remplacez par le chemin de votre image
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: CustomButton(
                buttonText: 'Next',
                onPressed: () {
                  Get.to(LoginView(),binding: LoginBinding());
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Text(
                    'By joining you agree to ours terms of service and',
                    style: StyleResources
                        .LABEL_TEXT_STYLE, // Use the style from StyleResources
                  ),
                  Text(
                    "privacy policy",
                    style: StyleResources
                        .MeduimTitle, 
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
