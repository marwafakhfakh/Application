import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/ImageRessources.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/modules/quiz/bindings/quiz_binding.dart';
import 'package:application/app/modules/quiz/views/quiz_view.dart';
import 'package:application/app/modules/register/views/register_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  CategoryView({Key? key}) : super(key: key);
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
                          
                  //  _showCategoryDialog(context);
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
                  "Category",
                    style: StyleResources
                        .BIGTITLE, // Use the style from StyleResources
                  ),
                ),
             ),
               Expanded(
          child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: OverflowBox(
                
                  maxWidth: MediaQuery.of(context).size.width,
                
                       child: Obx(()=>
                         GridView.builder(

                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 5.0, // spacing between rows
                              crossAxisSpacing: 5.0, // spacing between columns
                            ),
                            padding: EdgeInsets.all(8.0), // padding around the grid
 
                            itemCount:controller.categoryList.length,   
                            itemBuilder: (context, index) {
                          final category = controller.categoryList[index];
                              return InkWell(
                                
                                  onTap: () {
                                    print(category.id);
                                    Get.off(QuizView(),binding: QuizBinding(),arguments: [{"category_id":category.id}]);
                                  },
                                            child: Row( 
                                      
                                  
                                             children: [
                                              
                                               Container(
                                                        width: (MediaQuery.of(context).size.width - 90) / 2,
                                                        margin: EdgeInsets.only(left: 20, bottom: 20,),
                                                        height: 170,
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
                                ],
                                
                                ),
                                
                                
                                
                                                        child: Column(
                                                          children: [
                                                        Container(
                                margin: EdgeInsets.all(10),
                                              height: 100,
                                              width: 100,
                                              child: Image.network(
                                                category.image ?? "image",
                                              )
                                              
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10,right: 10),
                                              child:  Text(
                                                  category.name ?? "Name",
                                                  style: StyleResources
                                                      .TEXT_STYLE, // Use the style from StyleResources
                                                ),
                                            ),
                                                Container(
                                              margin: EdgeInsets.only(left: 10,right: 10),
                                              child:  Text(
                                                  category.departement ?? "Departement",
                                                  style: StyleResources
                                                      .TEXT_STYLE, // Use the style from StyleResources
                                                ),
                                            )
                                                          ],
                                                        ),
                                               ),
                                                        
                                             ],
                                           ),
                              );
                                       }),
                       ),
          ),
        ))
      ]),
    );
  }

}
