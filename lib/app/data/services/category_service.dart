import 'package:application/app/data/models/category_model.dart';
import 'package:application/app/data/services/baseApi.dart';
import 'package:dio/dio.dart';
class CategoryServices {
  static Dio client = Dio();

  static Future<List<Category>?> fetchCategories() async {
    try {
      Response response = await client.get(
           "${ApiConfig.baseApi}/get", );

      if (response.statusCode == 200) {
        var jsonString = response.data.toString();
        return  categoryFromJson(jsonString);
      } else {
        // Afficher un message d'erreur
        return null;
      }
    } catch (e) {
      // Gérer les erreurs, par exemple, en affichant un message d'erreur
      print("Erreur: $e");
      return null;
    }
  }
}
