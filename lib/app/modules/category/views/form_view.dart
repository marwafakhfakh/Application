import 'dart:io';

import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/data/models/category_model.dart';
import 'package:application/app/modules/category/controllers/category_controller.dart';
import 'package:application/app/modules/category/views/category_view.dart';

class FormView extends GetView<CategoryController> {
  FormView({Key? key}) : super(key: key);

  late AddCategory categoryData;
  Rx<File?> _selectedImage = Rx<File?>(null);
  String name = "";
  String departement = "";
 // File? _selectedImage; // Initialize it to null
  String imageName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      "Ajouter Category",
                      style: StyleResources.APP_BAR_TITLE_STYLE,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.TextColor4),
                    ),
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                //Département
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Departement',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.TextColor4),
                    ),
                  ),
                  onChanged: (value) {
                    departement = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CustomButton(
                    buttonText: 'Ajouter image',
                    onPressed: () {
                      _pickerImageFromGallery();
                    },
                  ),
                ),
               Obx(()=>
                       _selectedImage.value != null
                          ? Image.file(_selectedImage.value!)
                          : const Text("please select a photo"),
                    ),
                Container(
                  child: CustomButton(
                    buttonText: 'Ajouter image Camera',
                    onPressed: () {
                      _pickerImageFromCamera();
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CustomButton(
                    buttonText: 'Ajouter Category',
                    onPressed: () async {
                      if (_selectedImage.value != null) {
                        print("selected image :${_selectedImage.value!.path}");
                        categoryData = AddCategory(
                          name: name,
                          departement: departement,
                          image: _selectedImage.value!.path,
                        );
                        await controller.addCategory(categoryData, imageName);
                        Get.to(CategoryView());
                      } else {
                        print("Please select an image");
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
void _pickerImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    print("image" + (_selectedImage.value?.path ?? "No image selected"));

    imageName = returnedImage.name;
    _selectedImage.value = File(returnedImage.path);
  }

  void _pickerImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    print("image" + (_selectedImage.value?.path ?? "No image selected"));
    _selectedImage.value = File(returnedImage.path);
  }
}

