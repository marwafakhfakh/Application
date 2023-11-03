import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/modules/category/views/category_view.dart';
import 'package:application/app/modules/login/views/login_view.dart';
import 'package:application/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
 RegisterView({Key? key}) : super(key: key);
    final registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColorDark,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              'Welcome User ',
              style: StyleResources.BIGTITLE,
            ),
            Text(
              "Sign up to join",
              style: StyleResources.PRIMARY_RICH_TEXT_FONT_STYLE,
            ),
            SizedBox(
              height: 90,
            ),
            SizedBox(
              child: Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.73,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 30),
                              margin: EdgeInsets.only(left: 50),
                              child: TextButton(
                                onPressed: () {
                                  Get.to(LoginView());
                                },
                                child: Text(
                                  'Sign In',
                                  style: StyleResources
                                      .VALUE_TEXT_STYLE, // Use the style from StyleResources
                                ),
                              )),
                          Container(
                              padding: EdgeInsets.only(top: 30),
                              margin: EdgeInsets.only(right: 50),
                              child: TextButton(
                                onPressed: () {
                                  Get.to(CategoryView());
                                },
                                child: Text(
                                  'Sign Up',
                                  style: StyleResources
                                      .VALUE_TEXT_STYLE, // Use the style from StyleResources
                                ),
                              )),
                        ],
                      ),
                      Container(
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 60),
                              child: Form(
                                key: controller.registerFormKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: controller.nameController,
                                      validator: (v) {
                                          

                                      },
                                      onSaved: (v) {
                                        controller.name = v!;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: 'User',
                                        prefixIcon: Icon(Icons.person),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                              color: AppColors.TextColor4),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    TextFormField(
                                            controller: controller.emailController,
                                            validator: (v) {
                                              return controller.validateEmail(v!);
                                            },
                                            onSaved: (v) {
                                              controller.email = v!;
                                            },
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'Email',
                                              prefixIcon: Icon(Icons.email),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: BorderSide(
                                                    color: AppColors.TextColor4),
                                              ),
                                            ),
                                       ),
                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      controller: controller.passwordController,
                                      validator: (v) {
                                        return controller.validatePassword(v!);
                                      },
                                      onSaved: (v) {  controller.password =v!;},
                                      keyboardType: TextInputType.visiblePassword,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        prefixIcon: Icon(Icons.password),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                              color: AppColors.TextColor4),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Obx(() => controller.isLoading.value == true ?
                                   const Center(child:  
                                   CircularProgressIndicator()): const Text(""),),

                                   
                                      const SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      child: CustomButton(
                                        buttonText: 'Sign Up',
                                        onPressed: () {
                                          controller.doRegister();
                                          //Get.to(CategoryView());
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(LoginView());
                                      },
                                      child: Text(
                                        'Have an account ?',
                                        style: StyleResources
                                            .MeduimTitle, // Use the style from StyleResources
                                      ),
                                    )
                                  ],
                                ),
                              )))
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
