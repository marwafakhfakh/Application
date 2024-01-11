
import 'package:application/app/data/models/quiz_model.dart';
import 'package:application/app/data/models/quizhistorique_model.dart';
import 'package:application/app/data/services/baseApi.dart';
import 'package:dio/dio.dart';

class QuizHistoriqueServices {
  static Dio client = Dio();

  static Future<List<Quizzeshistorical>?> fetchQuizzeshistorical() async {
    try {
      Response response = await client.get(
           "${ApiConfig.baseApi}/quizzeshistorical", );
      print("response service");
      print(response);
      final quizzeshistorical = (response.data["quizzeshistorical"] as List).map((item) {
          return Quizzeshistorical.fromJson(item);
        }).toList();
      return quizzeshistorical ;
 
    } catch (e) {
      // Gérer les erreurs, par exemple, en affichant un message d'erreur
      print("Erreur: $e");
      return null;
    }
  }
  
}
