import 'package:api_integration/views/home2/hom2Controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Home2Controller>(Home2Controller());
  }
}
