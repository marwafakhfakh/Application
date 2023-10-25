import 'package:get/get.dart';

import '../controllers/ready_controller.dart';

class ReadyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadyController>(
      () => ReadyController(),
    );
  }
}
