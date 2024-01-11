import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/data/models/question_model.dart';
import 'package:application/app/data/models/quizhistorique_model.dart';
import 'package:application/app/modules/quiz/views/quiz_view.dart';
import 'package:application/app/modules/quizhistory/bindings/quizhistory_binding.dart';
import 'package:application/app/modules/quizhistory/views/quizhistory_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:linear_timer/linear_timer.dart';

import '../controllers/question_controller.dart';

class QuestionView extends GetView<QuestionController> {
  const QuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.PrimaryColorDark,
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 40),
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
                        Get.to((QuizView()));
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
                      onPressed: () {},
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
                'Flutter Quiz 01/05',
                style: StyleResources
                    .BIGTITLE, // Use the style from StyleResources
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 10, bottom: 10, right: 10),
              child: Obx(
                () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.questionList.length,
                    itemBuilder: (context, index) {
                      final question = controller.questionList[index];
                      // final option = question.options[index];

                      return Card(
                          shadowColor: AppColors.TextColor2,
                          child: SizedBox(
                              width: 380,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, left: 20),
                                // child: Text("data"),
                                child: Column(
                                  children: [
                                    //questions
                                    Text(
                                      question.text ?? "text",
                                      style: StyleResources
                                          .SELECTED_TEXT_FONT_STYLE, // Use the style from StyleResources
                                    ),

                                    SizedBox(
                                      height: 300,
                                      width: 400,
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: controller
                                              .questionList[index]
                                              .options
                                              .length,
                                          itemBuilder: (context, index2) {
                                            final option =
                                                question.options[index];
                                            return Row(
                                              children: [
                                                SizedBox(
                                                  width: 200,
                                                  height: 60,
                                                  child: CheckboxListTile(
                                                    value: controller
                                                        .checkedValue.value,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        controller.checkedValue
                                                            .value = newValue!;
                                                      });
                                                    },
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    title: Text(
                                                      controller
                                                          .questionList[index]
                                                          .options[index2]
                                                          .value,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    //  <-- leading Checkbox
                                                  ),
                                                )
                                              ],                
                                            );
                                          }),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 60, right: 60),
                                          child: LinearTimer(
                                            duration:
                                                const Duration(seconds: 40),
                                            color: AppColors.PrimaryColor,
                                            minHeight: 15,
                                            backgroundColor:
                                                AppColors.PrimaryColorLight,
                                            onTimerEnd: () {},
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          child: Text(
                                            '40 seconds',
                                            style: StyleResources
                                                .SECONDARY_LABEL_TEXT_STYLE, // Use the style from StyleResources
                                          ),
                                        ),
                                        if (
                                        controller.questionList.indexOf(question) == controller.questionList.length-1)
                                          Container(
                                            margin: EdgeInsets.only(top: 20),
                                            child: TextButton(
                                              onPressed: () {
                                                Get.to(QuizhistoryView(),binding:QuizhistoryBinding());
                                              },
                                              child: Text(
                                                'Terminer',
                                                style: StyleResources
                                                    .VALUE_TEXT_STYLE,
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              )));
                    }),
              ),
            ),
          ),
          
        ]
        
        
        ),
        
        );
  }

  void setState(Null Function() param0) {}
}
