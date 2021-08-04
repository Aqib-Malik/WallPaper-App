import 'dart:convert';

import 'package:api_integration/commonWdgets/customWidgets.dart';
import 'package:api_integration/constants/strings.dart';
import 'package:connectivity/connectivity.dart';
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

  checkConnection() async {
    var connectivityResult = await new Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
    } else {
      CustomWidget.SnackBarr("No Internet", "Internet is not connected");
    }
  }

  @override
  void onInit() {
    checkConnection();
    fetchapi();
    super.onInit();
  }
}
