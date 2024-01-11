import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/ImageRessources.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/data/models/quiz_model.dart';
import 'package:application/app/modules/category/views/category_view.dart';
import 'package:application/app/modules/question/bindings/question_binding.dart';
import 'package:application/app/modules/question/views/question_view.dart';
import 'package:application/app/modules/quiz/views/form_view.dart';
import 'package:flutter/material.dart';
import 'package:application/app/modules/category/bindings/category_binding.dart';

import 'package:get/get.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
   QuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
//AddQuiz? quizData = Get.arguments as AddQuiz?;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
      Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: 
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: IconButton(
                color: AppColors.PrimaryColorDark,
                iconSize: 35,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                ),
                onPressed: () {
                  Get.off(CategoryView(),binding:CategoryBinding());
                },
              ),
            ),
            Container(
              child: IconButton(
                color: AppColors.PrimaryColorDark,
                iconSize: 35,
                icon: const Icon(
                  Icons.add,
                ),
                onPressed: () {
                  Get.to(FormView());
                  //arguments: [{"categorie_id":controller.categorie_id}]);
                },
              ),
            ),
          ],
        )),
      ),
      Container(
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.only(left: 30),
        child: Container(
          child: Text(
            'Quiz',
            style: StyleResources
                .APP_BAR_TITLE_STYLE, // Use the style from StyleResources
          ),
        ),
      ),
      Expanded(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: InkWell(
                      onTap: () {
                        Get.to((QuestionView()),binding: QuestionBinding());
                      },
                      child: Obx(()=>
                         ListView.builder
                        (
                             itemCount:controller.quizzList.length,   
                            itemBuilder: (context, index)
                             {
                          final quizz = controller.quizzList[index];
                          
                          print("csdsdsd"+quizz.image);
                              return Column(
                              
                                children: [

                                SizedBox(
                                  height: 15, 
                                ),
                                Container(
                                    width:
                                        (MediaQuery.of(context).size.width - 50),
                                    height: 150,
                      
                                    //  padding: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: AppColors.PrimaryColorLight,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: AppColors
                                            .PrimaryColor, // Replace with the desired border color
                                        width:
                                            2.0, // Adjust the border width as needed
                                      ),
                                    ),
                                    child: Padding(

                                      padding: const EdgeInsets.only(left: 5, right: 10),
                                      child: Row(
                                        
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          
                                            Container(
                                              height: 100,
                                              width:100,
                                              child: Image.network(
                                              quizz.image ,
                                                ),
                                            ),
                                              
                                              
                                        
                                         
                                          SizedBox(height: 10),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: 20,left: 5),
                                            child: Column(children:
                                             [
                                              Text(
                                                 quizz.titre ?? "Titre",
                                                style: StyleResources
                                                    .TITLE, // Use the style from StyleResources
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: Text(
                                                   quizz.description ?? "description",
                                                    maxLines: 3,
                                                    overflow: TextOverflow.clip,
                                                  style: StyleResources
                                                      .LABEL_TEXT_STYLE, // Use the style from StyleResources
                                                ),
                                              ),
                                              Text(
                                                'Niveau : niveau intermédiare',
                                                style: StyleResources
                                                    .DROPDOWN_TITLE_TEXT_STYLE, // Use the style from StyleResources
                                              ),
                                            ]),
                                          )
                                        ],
                                      ),
                                    ))
                              ]);
                            }),
                      )))))
    ]));
  }

}