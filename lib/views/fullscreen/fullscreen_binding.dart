import 'package:api_integration/views/fullscreen/fulScreenController.dart';
import 'package:get/get.dart';

class FullScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FullScreenController>(FullScreenController());
  }
}
