
import 'dart:convert';
import 'dart:io';

import 'package:application/app/data/models/quiz_model.dart';
import 'package:application/app/data/services/baseApi.dart';
import 'package:dio/dio.dart';
class QuizServices {
  static Dio client = Dio();

    static Future<List<Quizz>?> fetchQuizz(int categoryId) async {
    try {
      Response response = await client.get(
        "${ApiConfig.baseApi}/quizz/$categoryId",
      );

      print("response service");
      print(response);

      if (response.statusCode == 200) {
        final List<dynamic> quizzesData = response.data["quizzes"];

        final quizzList = quizzesData.map((item) {
          return Quizz.fromJson(item);
        }).toList();

        return quizzList.cast<Quizz>();
      } else {
        // Handle non-200 status code, for example by throwing an exception
        throw Exception("Failed to fetch quizz. Status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle errors, for example, by logging and returning null
      print("Error: $e");
      return null;
    }
  }
 static Future<Map<String, dynamic>?> addQuiz(AddQuiz quizData,String imageName) async {
  
  Map<String, dynamic> reqdata = quizData.toJson();
  var file =  MultipartFile.fromBytes(File(quizData.image).readAsBytesSync(), filename: imageName);
  print(file.filename);
 
    FormData formData = FormData.fromMap(reqdata);
  formData.files.addAll({
     MapEntry("image", await MultipartFile.fromFile(quizData.image,filename: imageName)),
    });
    
  try {
    Response response = await client.post(
      "${ApiConfig.baseApi}/quizz",
      data: formData,
    );
    print(reqdata);
    print(response.statusCode);
    // Check the status code
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      Map<String, dynamic> responseData = json.decode(response.data);
      return responseData;
    } else {
      // Handle the error
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    // Handle the error
    print("Error: $e");
    return null;
  }
}
  
}