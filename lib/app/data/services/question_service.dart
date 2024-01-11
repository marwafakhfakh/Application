import 'package:application/app/data/models/question_model.dart';
import 'package:application/app/data/services/baseApi.dart';
import 'package:dio/dio.dart';
class QuestionServices {
  static Dio client = Dio();

  static Future<List<Question>?> fetchQuestions() async {
    try {
      Response response = await client.get(
           "${ApiConfig.baseApi}/questions", );
      print("response service");
      print(response);
      final questions = (response.data["questions"] as List).map((item) {
          return Question.fromJson(item);
        }).toList();
      return questions;
 
    } catch (e) {
      // Gérer les erreurs, par exemple, en affichant un message d'erreur
      print("Erreur: $e");
      return null;
    }
  }
  
  }
  

