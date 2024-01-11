import 'package:get/get.dart';
import 'package:application/app/data/models/category_model.dart';
import 'package:application/app/data/services/category_service.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
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

  void addCategory(AddCategory categoryData) {}
  
}
