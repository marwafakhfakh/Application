import 'package:application/app/data/models/question_model.dart';
import 'package:application/app/data/services/question_service.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  //TODO: Implement QuestionController

var isLoading = true.obs;
  final RxList<Question> questionList = <Question>[].obs;
  RxBool checkedValue = true.obs;

  @override
  void onInit() {
    super.onInit();  
     fetchQuestions();
  }

 Future<void> fetchQuestions() async {
    try {
      isLoading(true);
      final List<Question>? questionListData = await QuestionServices.fetchQuestions();
      print("Questionnnnnnn");
      print(questionListData);
      if (questionListData != null && questionListData.isNotEmpty) {
        questionList.assignAll(questionListData);
      } else {
        
        // Handle the case where data is null or empty, for example:
        // categoryList.clear(); // Clear the existing list or handle it based on your requirements.
      }
    } finally {
      isLoading(false);
    }
  }
}
