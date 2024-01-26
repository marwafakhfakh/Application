import 'package:get/get.dart';
import 'package:application/app/data/models/category_model.dart';
import 'package:application/app/data/services/category_service.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
    RxBool isAddingCategory = false.obs;

  final RxList<Category> categoryList = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      final List<Category>? categoryListData = await CategoryServices.fetchCategories();
      print("hhhhhhhhhhhh");
      print(categoryListData);
      if (categoryListData != null && categoryListData.isNotEmpty) {
        categoryList.assignAll(categoryListData);
      } else {
        // Handle the case where data is null or empty, for example:
        // categoryList.clear(); // Clear the existing list or handle it based on your requirements.
      }
    } finally {
      isLoading(false);
    }
  }

//   {}
  Future <void> addCategory(AddCategory categoryData, String imageName) async {
    try {
      isAddingCategory(true);
      final Map<String, dynamic>? addData = await CategoryServices.addCategory(categoryData);

      if (addData != null) {
        print("Quiz added successfully!");
        fetchCategories();
      } else {
        print("Failed to add quiz");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isAddingCategory(false);
    }
  }
}
