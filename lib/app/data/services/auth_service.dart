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
    print("${ApiConfig.baseApi}/register");

      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to register');
      }
    
  }

  // login
  static Future<Map<String, dynamic>> login({
  
    required String email,
    required String password,
  }) async {
  
      Response response = await dio.post(
        "${ApiConfig.baseApi}/login", 
        // Utilisez ApiConfig.baseApi pour accéder à la base de l'API
        data: {
          "email": email,
          "password": password,
        },
      );
    print("${ApiConfig.baseApi}/login");

      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to login');
      }
    
  }

}
