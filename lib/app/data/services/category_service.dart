import 'dart:convert';

import 'package:application/app/data/models/category_model.dart';
import 'package:application/app/data/services/baseApi.dart';
import 'package:dio/dio.dart';
class CategoryServices {
  static Dio client = Dio();

  static Future<List<Category>?> fetchCategories() async {
    try {
      Response response = await client.get(
           "${ApiConfig.baseApi}/categories/cat", );
      print("response service");
      print(response);
      final categories = (response.data["categories"] as List).map((item) {
          return Category.fromJson(item);
        }).toList();
      return categories;
 
    } catch (e) {
      // Gérer les erreurs, par exemple, en affichant un message d'erreur
      print("Erreur: $e");
      return null;
    }
  }
  
   static Future<Map<String, dynamic>?> addCategory(AddCategory categoryData) async {
    try {
      Response response = await client.post(
        "${ApiConfig.baseApi}/categories/cat",
        data: categoryData.toJson(), 
      );

      if (response.statusCode == 201) {
        Map<String, dynamic> responseData = json.decode(response.data["categories"]);
        return responseData;
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
  
  
}
