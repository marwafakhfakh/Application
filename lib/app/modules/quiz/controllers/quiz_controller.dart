import 'dart:io';
import 'package:application/app/data/models/category_model.dart';
import 'package:application/app/data/models/quiz_model.dart';
import 'package:application/app/data/services/category_service.dart';
import 'package:application/app/data/services/quiz_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class QuizController extends GetxController {
  
  var isLoading = true.obs;
  final RxList<Quizz> quizzList = <Quizz>[].obs;
  RxBool isAddingQuiz = false.obs;
    final RxList<Category> categoryList = <Category>[].obs;
    Rx<Category> selectedValue = Category().obs;
  dynamic categorie_id =Get.arguments[0]["category_id"] ;
  final TextEditingController textEditingController = TextEditingController();
//final selected = Category().obs;

  //  void setSelected(Category? value){
  //    selectedValue.value = value!;
  //  }
  @override
 void onInit() async{
  print(categorie_id);
  super.onInit();
  await fetchQuizz();
  await fetchCategories() ;
}

Future<void> fetchQuizz() async {
  try {
    isLoading(true);

    // Assuming categorie_id is a property of your controller
    final List<Quizz>? quizzListData = await QuizServices.fetchQuizz(categorie_id);

    print("mmmmmmmmmmm");
    print(quizzListData);
    //print(categorie_id);
    if (quizzListData != null) {
      quizzList.assignAll(quizzListData);
    } else {
      // Handle the case when quizzListData is null
      print("Quizz data is null");
    }
  } finally {
    isLoading(false);
  }
}
Future<void> fetchCategories() async {
    try {
      isLoading(true);
      final List<Category>? categoryListData = await CategoryServices.fetchCategories();
      print("hhhhhhhhhhhh");
     // categoryListData!.map((e) {print(e);});
      print(categoryListData);
      if (categoryListData != null && categoryListData.isNotEmpty) {
        categoryList.assignAll(categoryListData);
      } else {
        // Handle the case where data is null or empty, for example:
        // categoryList.clear(); // Clear the existing list or handle it based on your requirements.
      }
    } finally {
      isLoading(false);
    }
  }

// ADD QUIZ AVEC METHODE POST
  Future<void> addQuiz(AddQuiz quizData,String imageName) async {
    try {
      isAddingQuiz(true);
      final Map<String, dynamic>? addData = await QuizServices.addQuiz(quizData,imageName);

      if (addData != null) {
        print("Quiz added successfully!");
        fetchQuizz();
      } else {
        print("Failed to add quiz");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isAddingQuiz(false);
    }
  }
  
}
