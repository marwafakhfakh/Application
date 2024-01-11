import 'dart:io';

import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/data/models/category_model.dart';
import 'package:application/app/modules/category/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';

class FormView extends GetView<CategoryController> {
  FormView({Key? key}) : super(key: key);
  File? _selectedImage;
  late AddCategory categoryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
              onChanged: (value) {},
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
              onChanged: (value) {},
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
            //images
            _selectedImage != null
                ? Image.file(_selectedImage!)
                : const Text("please select a photo"),
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
                onPressed: () {
                  //   print("selected image :${_selectedImage!}");
                  if (_selectedImage != null) {
                    // Assuming you have the necessary data in your view
                    categoryData = AddCategory(
                      name: "Your Name",
                      departement: "Your Departement",
                      image: _selectedImage!.path,
                    );
                    controller.addCategory(categoryData);
                  } else {
                    // Handle case when no image is selected
                    print(
                        "Please select an image"); // fel console tjini hedhy kif n3ml image ml gallery
                  }
                },
              ),
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
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  void _pickerImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }
}

void setState(Null Function() param0) {}
