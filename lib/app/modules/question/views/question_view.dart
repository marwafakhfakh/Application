import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/question_controller.dart';

class QuestionView extends GetView<QuestionController> {
  const QuestionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.PrimaryColorDark,
    
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: IconButton(
                        color: AppColors.PrimaryColorLight,
                        iconSize: 35,
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                        ),
                        onPressed: () {
                          
                        },
                      ),
                    ),
                    Container(
                      child: IconButton(
                        color: AppColors.PrimaryColorLight,
                        iconSize: 35,
                        icon: const Icon(
                          Icons.add,
                        ),
                        onPressed: () {
                      
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.only(left: 30),
                child: Container(
                  child: Text(
                    'Flutter Quiz 01',
                    style: StyleResources
                        .BIGTITLE, // Use the style from StyleResources
                  ),
                ),
             ),
              Container(
              child: Column(
            children:
             [
                    SizedBox(
                      child: Stack(
                        children: [
                          Container
                          (
                                  margin: EdgeInsets.only(top: 60),
                                  height: 500,
                                  width: 350,

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                  Column(
                                    children: [
                                  Container(
                                      padding: EdgeInsets.all(40),
                                      child:  Text(
                                      'Quels sont les différents modes de build en Flutter ?',
                                      style: StyleResources
                                          .SELECTED_TEXT_FONT_STYLE, // Use the style from StyleResources
                                          ),
                                    ),
                                   
                                    Padding(
                                      padding: const EdgeInsets.only(left:50),
                                      child: Row(
                                        
                                        children: [
                                          Container(
                                            child: Text("data"),
                                          ),
                                          const VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
            color: AppColors.Background,
          ),
                                        ],
                                      ),
                                    )
                                    ],
                                  )
                                   
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                          ),
                          )
            ]
      )
    )]));
  }
}
