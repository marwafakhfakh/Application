import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/modules/category/views/category_view.dart';
import 'package:application/app/modules/register/views/register_view.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColorDark,
      body: ListView(
        //padding: EdgeInsets.only(left:30,top: 100),
        children: <Widget>[
          Container(
            
            padding: EdgeInsets.only(top: 80),
            
            child: Column(
              //text
              children: [
                Text(
                  'Welcome back ',
                  style: StyleResources.BIGTITLE,
                ),
                Text(
                  "Sign in to continue",
                  style: StyleResources.PRIMARY_RICH_TEXT_FONT_STYLE,
                ),
              ],
            ),
          ),
          Container(
              child: Column(
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      height: 450,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            Get.to(RegisterView());
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
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15, top: 60),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                              labelText: 'Email',
                                              prefixIcon: Icon(Icons.email),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: BorderSide(
                                                  width :2.0,
                                                    color:
                                                        AppColors.TextColor4),
                      
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 30.0),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              prefixIcon: Icon(Icons.password),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: BorderSide(
                                                    color:
                                                        AppColors.TextColor4),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            child: CustomButton(
                                              buttonText: 'Login',
                                              onPressed: () {
                                                Get.to(CategoryView());
                                              },
                                            ),
                                          )
                                        ],
                                      )))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
           InkWell(
  onTap: () {
    // Add the action you want to perform when the text is tapped
  },
  child: Text(
    'Forget Password',
    style: StyleResources.PRIMARY_RICH_TEXT_FONT_STYLE, // Use the style from StyleResources
  ),
)
            ],
          ))
        ],
      ),
    );
  }
}
