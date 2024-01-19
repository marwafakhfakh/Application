import 'dart:io';

import 'package:application/app/ApplicationStyle/CustomButton.dart';
import 'package:application/app/ApplicationStyle/CustomText.dart';
import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:application/app/data/models/category_model.dart';
import 'package:application/app/data/models/quiz_model.dart';
import 'package:application/app/data/services/quiz_service.dart';
import 'package:application/app/modules/category/views/form_view.dart';
import 'package:application/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:application/app/modules/quiz/views/quiz_view.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';

class FormView extends GetView<QuizController> {
  FormView({Key? key}) : super(key: key);
 // File? _selectedImage;
  late AddQuiz quizData;
  int niveau_id = 1;
  String titre = "";
  String description = "";
  //category_id= category;
  String imageName = "";
  //Category? selectedValue;
  Rx<Category?> selectedValue = Rx<Category?>(null);
  Rx<File?> _selectedImage = Rx<File?>(null);

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
                      "Ajouter Quiz",
                      style: StyleResources.APP_BAR_TITLE_STYLE,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Titre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.TextColor4),
                    ),
                  ),
                  onChanged: (value) {
                    titre = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.TextColor4),
                    ),
                  ),
                  onChanged: (value) {
                    description = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<Category?>(
                        isExpanded: true,
                        hint: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: controller.categoryList
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item.name.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),

                        value: selectedValue.value,
                        onChanged: (value) {
                          selectedValue.value = value!;
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          width: 200,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          maxHeight: 200,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                        dropdownSearchData: DropdownSearchData(
                          searchController: controller.textEditingController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              right: 8,
                              left: 8,
                            ),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: controller.textEditingController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'Search for an item...',
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            return item.value.toString().contains(searchValue);
                          },
                        ),
                        //This to clear the search value when you close the menu
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            controller.textEditingController.clear();
                          }
                        },
                      ),
                    ),
                  ),
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
                Obx(()=>
                   _selectedImage.value != null
                      ? Image.file(_selectedImage.value!)
                      : const Text("please select a photo"),
                ),
                Container(
                  child: CustomButton(
                    buttonText: 'Ajouter image camera',
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
                      buttonText: 'Ajouté',
                      onPressed: () async {
                        //  print("image"+ _selectedImage.value!.path);
                        if (_selectedImage.value != null) {
                          if (selectedValue.value != null &&
                              selectedValue.value!.id != null) {
                            quizData = AddQuiz(
                              titre: titre,
                              description: description,
                              categorieId: selectedValue.value!.id!,
                              historiqueId: 1,
                              niveauId: niveau_id,
                              image: _selectedImage.value!.path,
                            );
                            await controller.addQuiz(quizData, imageName);
                            Get.to(QuizView());
                          } else {
                            print("Please select a category");
                          }
                        } else {
                          print("Please select an image");
                        }
                      }),
                ),
                SizedBox(
                  height: 12,
                ),
                /* Container(
                  child: CustomButton(
                    buttonText: 'Ajouter Quiz',
                    onPressed: () {
                    Get.to(QuizView());
                    },
                  ),
                ),*/
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
