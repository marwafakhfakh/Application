import 'package:application/app/data/services/auth_service.dart';
import 'package:application/app/modules/category/views/category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

var isLoading = false.obs;
  late TextEditingController emailController,passwordController;
  String  email = '', password ='';
  final storage = new FlutterSecureStorage();

  final loginFormKey = GlobalKey<FormState>();
  final count = 0.obs;
  
  get response => null;
  @override
  void onInit() {
   
     emailController = TextEditingController();
      passwordController = TextEditingController();
    super.onInit();
  }

   @override
  void dispose() {
    
     emailController.dispose();
      passwordController.dispose();
    super.dispose();
  }



  String? validateEmail(String value){
    if(!GetUtils.isEmail(value)){
     return "this is wrong email";
    }else {
      return null ;
    }
  }
    String? validatePassword(String value){
    if(value.length <=5){
     return "this is wrong password";
    }else {
      return null ;
    }
  }



doLogin() async {
  bool isValidate = loginFormKey.currentState!.validate();
  if(isValidate){
    isLoading(true);
    try{
      print("sddddddddddddddddddddddddddddddddddddd");
        var data = await AuthService.login(
          email:emailController.text,password:passwordController.text);
      print(data);
      
     
      // ignore: unnecessary_null_comparison
      if (data != null) {
        print("we are inside????");
 // var response;
 final token = data['data']['token'] as String;
  await storage.write(key: "token", value: token);

  print(await storage.read(key:"token"));

       loginFormKey.currentState!.save();
      Get.to(CategoryView());


      }else{
        Get.snackbar("login","problem in login");
      }
    } finally {
      isLoading(false);
    }
  }
}

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
