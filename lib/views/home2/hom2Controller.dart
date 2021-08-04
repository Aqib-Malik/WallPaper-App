import 'dart:convert';

import 'package:api_integration/constants/strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Home2Controller extends GetxController {
  var isload = false.obs;
  List images = [].obs;
  var page = 1.obs;
  var isloading = true.obs;

  fetchapi() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {'Authorization': Strings.photoApi}).then((value) {
      Map result = jsonDecode(value.body);

      images = result['photos'];
      isloading.value = false;

      print(images[0]);
    });
  }

  loadmore() async {
    isload.value = true;
    page.value = page.value + 1;

    String url = 'https://api.pexels.com/v1/curated?per_page=80&page=' +
        page.value.toString();
    await http.get(Uri.parse(url),
        headers: {'Authorization': Strings.photoApi}).then((value) {
      Map result = jsonDecode(value.body);

      images.addAll(result['photos']);
      isload.value = false;
    });
  }

  @override
  void onInit() {
    fetchapi();
    super.onInit();
  }
}
