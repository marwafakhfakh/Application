import 'package:application/app/data/models/quizhistorique_model.dart';
import 'package:application/app/data/services/quizhistorique.dart';
import 'package:get/get.dart';

class QuizhistoryController extends GetxController {
 var isLoading = true.obs;
  final RxList<Quizzeshistorical> quizzeshistoricalList = <Quizzeshistorical>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuizzeshistorical();
  }

  Future<void> fetchQuizzeshistorical() async {
    try {
      isLoading(true);
      final List<Quizzeshistorical>? quizzeshistoricalListData = await QuizHistoriqueServices.fetchQuizzeshistorical();
      print("mmmmmmmmmmm");
      print(quizzeshistoricalListData);
      if (quizzeshistoricalListData != null && quizzeshistoricalListData.isNotEmpty) {
        quizzeshistoricalList.assignAll(quizzeshistoricalListData);
      } else {
        
      }
    } finally {
      isLoading(false);
    }
  }}
