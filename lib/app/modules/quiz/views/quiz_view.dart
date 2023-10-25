import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/ImageRessources.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/modules/category/views/category_view.dart';
import 'package:application/app/modules/question/views/question_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Get.to(CategoryView());
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
                  _showCategoryDialog(context);
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
                        Get.to((QuestionView()));
                      },
                      child: ListView.builder
                      (
                          itemCount: (20.toDouble() / 2).toInt(),
                          itemBuilder: (_, i) {
                            return Column(children: [
                              SizedBox(
                                height: 15, // Adjust the spacing as needed
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
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          child: CustomImage(
                                            imagePath:
                                                'assets/Images/codecraft.png',

                                            // Remplacez par le chemin de votre image
                                          ),
                                        ),
                                        // Replace with your image URL
                                        SizedBox(height: 10),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 50, left: 20, right: 10),
                                          child: Column(children:
                                           [
                                            Text(
                                              'Flutter Quiz 01',
                                              style: StyleResources
                                                  .TITLE, // Use the style from StyleResources
                                            ),
                                            Text(
                                              'This is a flutter quiz',
                                              style: StyleResources
                                                  .LABEL_TEXT_STYLE, // Use the style from StyleResources
                                            ),
                                            Text(
                                              'Niveau : niveau intermédiare',
                                              style: StyleResources
                                                  .LABEL_TEXT_STYLE, // Use the style from StyleResources
                                            ),
                                          ]),
                                        )
                                      ],
                                    ),
                                  ))
                            ]);
                          })))))
    ]));
  }

  Future<void> _showCategoryDialog(BuildContext context) async
   {
    String categoryName = '';
    String departmentName = '';
    String imagePath = '';
    String selectedConfType = 'Niveau 1';
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Ajouter Quiz'),
            contentPadding: EdgeInsets.all(20.0),
            children: <Widget>[
              // titre
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Titre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.TextColor4),
                  ),
                ),
                onChanged: (value) {
                  departmentName = value;
                },
              ),

              SizedBox(
                height: 20,
              ),

              //Département
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.TextColor4),
                  ),
                ),
                onChanged: (value) {
                  departmentName = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(value: 'Niveau 1', child: Text("Niveau 1")),
                  DropdownMenuItem(value: 'Niveau 2', child: Text("Niveau 2")),
                  DropdownMenuItem(value: 'Niveau 3', child: Text("Niveau 3")),
                ],
                decoration: InputDecoration(border: OutlineInputBorder()),
                value: selectedConfType,
                onChanged: (value) {
                  setState(() {
                    selectedConfType = value!;
                  });
                },
              ),

              SizedBox(
                height: 20,
              ),
              //images
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Chemin de l\'image',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.TextColor4),
                  ),
                ),
                onChanged: (value) {
                  imagePath = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: CustomButton(
                  buttonText: 'Ajouter',
                  onPressed: () {
                    Get.back();
                  },
                ),
              )
            ],
          );
        });
  }

  void setState(Null Function() param0) {}
}
