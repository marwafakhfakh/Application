import 'package:application/app/data/models/category_model.dart';
import 'package:application/app/data/services/category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
    final RxList<Category> categoryList = <Category>[].obs;

  //var categoryList = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      var categories = await CategoryServices.fetchCategories();
      if (categories != null) {
        categoryList.assignAll(categories);
        print("cxcvbnnbv"+categoryList.length.toString());
      }
    } finally {
      isLoading(false);
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
}
