import 'package:api_integration/views/searchview/searchview_controller.dart';
import 'package:get/get.dart';

class SearchViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SearchViewController>(SearchViewController());
  }
}
