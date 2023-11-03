import 'package:application/app/data/services/baseApi.dart';
import 'package:dio/dio.dart';
 // Importez la classe ApiConfig

class AuthService {
  static Dio dio = Dio();

  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
  
      Response response = await dio.post(
        "${ApiConfig.baseApi}/register", 
         
        // Utilisez ApiConfig.baseApi pour accéder à la base de l'API
        data: {
          "name": name,
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to register');
      }
    
  }

  // login ...
}
