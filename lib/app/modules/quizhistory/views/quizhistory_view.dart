import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/modules/quiz/views/quiz_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/quizhistory_controller.dart';

class QuizhistoryView extends GetView<QuizhistoryController> {
  const QuizhistoryView({Key? key}) : super(key: key);
  
 
  
   /*String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }*/
  @override
  Widget build(BuildContext context) {
  //final DateTime date;

    return Scaffold(
      // backgroundColor: AppColors.PrimaryColorLight,
      body: Column(
        children: [
          Stack(children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: const BoxDecoration(
                    color: AppColors.Background,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30, top: 30),
                        child: Text(
                          'Quiz History ',
                          style: StyleResources.BIGTITLE,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: OverflowBox(
                      maxWidth: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () {},
                        child: Obx(()=>
                          ListView.builder(
                             itemCount:controller.quizzeshistoricalList.length,
                             
                              itemBuilder: (context, index)
                               {
                                 final quizzeshistorical = controller.quizzeshistoricalList[index];
                                return Column(
                                  
                                  children: [
                                    SizedBox(
                                      height: 15, // Adjust the spacing as needed
                                    ),
                                    Container(
                                      width: (MediaQuery.of(context).size.width -
                                          50),
                                      height: 150,
                        
                                      //  padding: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: AppColors.PrimaryColorLight,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: AppColors
                                              .Background, // Replace with the desired border color
                                          width:
                                              3.0, // Adjust the border width as needed
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Row(children: [
                                          VerticalDivider(
                                            width: 20,
                                            thickness: 2,
                                            indent: 20,
                                            endIndent: 20,
                                            color: AppColors.Background,
                                          ),
                                     Padding(
                                       padding:const EdgeInsets.only(
                                                left: 10, top: 20),
                                       child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          
                                           Container(
                                                      child: Text(
                                                        quizzeshistorical.titre ?? "titre",
                                                        style: StyleResources
                                                            .MINITITLE, // Use the style from StyleResources
                                                      ),),
                                                      Container(
                                                    padding: EdgeInsets.only(top: 10),
                                                    child: Text(
                                                      quizzeshistorical.score.toString() ?? "score",
                                                    style: StyleResources.TITLE_STYLE, // Use the style from StyleResources
                                                    ),
                                                  ),
                                                        Container(
                                                    padding:
                                                        EdgeInsets.only(top: 10),
                                                    child: Text(
                                                      quizzeshistorical.responseTime ?? "responsetime",
                                                      style: StyleResources
                                                          .TITLE_STYLE, // Use the style from StyleResources
                                                    ),
                                                  ),
                                                   Container(
                                                    padding:
                                                        EdgeInsets.only(top: 10),
                                                    child: Text(
                                                       quizzeshistorical.date.toLocal().toString() ?? "date",
                                                      style: StyleResources
                                                          .SECONDARY_LABEL_TEXT_STYLE, // Use the style from StyleResources
                                                    ),
                                                  ),
                                        ],
                                       ),
                                     ),
                                     Container(
                                            
                                            width: 100, // Largeur souhaitée
                                            height: 50,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Action à effectuer lorsqu'on appuie sur le bouton
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.PrimaryColorLight,
                                                // Couleur du texte
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10), // Coins arrondis
                                                  side: BorderSide(
                                                    color: Colors
                                                        .green, // Couleur de la bordure
                                                    // width: 1.0, // Épaisseur de la bordure
                                                  ),
                                                ),
                                                elevation: 8,
                                                // Ombre
                                              ),
                                               child: Text(
                                                'Start again',
                                                style: StyleResources
                                                    .SUBTITLE_TITLE, // Use the style from StyleResources
                                              ),
                                              ))
                                        ])
                                      ),
                                    ),
                                  
                                 
                                    
                                  ],
                                );
                              }),
                        ),
                      ))))
        ],
      ),
    );
  }
  

}
