import 'package:application/app/data/services/auth_service.dart';
import 'package:application/app/modules/category/views/category_view.dart';
//import 'package:application/app/modules/question/views/question_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  var isLoading = false.obs;
  late TextEditingController nameController,emailController,passwordController;
  String name = '', email = '', password ='';
  final storage = new FlutterSecureStorage();

  final registerFormKey = GlobalKey<FormState>();
  final count = 0.obs;
  
  get response => null;
  @override
  void onInit() {
    nameController = TextEditingController();
     emailController = TextEditingController();
      passwordController = TextEditingController();
    super.onInit();
  }

   @override
  void dispose() {
      nameController.dispose();
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



doRegister() async {
  bool isValidate = registerFormKey.currentState!.validate();
  if(isValidate){
    isLoading(true);
    try{
      print("sddddddddddddddddddddddddddddddddddddd");
        var data = await AuthService.register(name:nameController.text,email:emailController.text,password:passwordController.text);
      print(data);
      
     
      // ignore: unnecessary_null_comparison
      if (data != null) {
        print("we are inside????");
 // var response;
 final token = data['data']['token'] as String;
  await storage.write(key: "token", value: token);

  print(await storage.read(key:"token"));

       registerFormKey.currentState!.save();
      Get.to(CategoryView());


      }else{
        Get.snackbar("register","problem in resgister");
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

