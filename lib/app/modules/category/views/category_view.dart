import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/ImageRessources.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/modules/quiz/views/quiz_view.dart';
import 'package:application/app/modules/register/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.PrimaryColorDark,
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.start, 
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
                          Get.to(RegisterView());
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
                          
                    _showCategoryDialog(context);
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
                    'Category',
                    style: StyleResources
                        .BIGTITLE, // Use the style from StyleResources
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
                        Get.to((QuizView()));
                      },
                       child: ListView.builder(
                         itemCount: (20.toDouble() / 2).toInt(),
                          itemBuilder: (_, i) {
                            return Row(
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width - 90) / 2,
                        margin: EdgeInsets.only(left: 30, bottom: 20),
                        height: 150,
                        padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: AppColors.PrimaryColorLight,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color:Colors.grey,
                                
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(2.0, 2.0)
                                  ),
                              BoxShadow(
                                  color:Colors.grey,
                                
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(-2.0,-2.0)
                                  ),
                            ]
                            ),
                        child: Column(
                          children: [
                           Container(
                            margin: EdgeInsets.all(10),
                                          height: 100,
                                          width: 100,
                                          child: CustomImage(
                                            imagePath:
                                                'assets/Images/flutterrr.png',

                                            // Remplacez par le chemin de votre image
                                          ),
                                          
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          child:  Text(
                                              'titre',
                                              style: StyleResources
                                                  .TEXT_STYLE, // Use the style from StyleResources
                                            ),
                                        )
                          ],
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width - 90) / 2,
                        margin: EdgeInsets.only(left: 30, bottom: 20),
                        height: 150,
                        padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: AppColors.PrimaryColorLight,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                       
                              BoxShadow(
                                  color:Colors.grey,
                                
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(2.0, 2.0)
                                  ),
                              BoxShadow(
                                  color:Colors.grey,
                                
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(-2.0,-2.0)
                                  ),
                          
                            ]
                            ),
                        child: Center(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text('hhhh'),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
        )))
      ]),
    );
  }

  Future<void> _showCategoryDialog(BuildContext context) async
   {
    String categoryName = '';
    String departmentName = '';
    String imagePath = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog
        (
                title: Text('Ajouter une catégorie'),
                contentPadding: EdgeInsets.all(20.0),
                children: <Widget>
                [
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.add),
                      labelText: 'Nom du Catégorie',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: AppColors.TextColor4),
                      ),
                    ),
                    onChanged: (value) {
                      categoryName = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nom du département',
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
                          }
                       );
                   
  
  }
}
