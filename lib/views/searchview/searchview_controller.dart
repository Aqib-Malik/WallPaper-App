import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_integration/constants/strings.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController {
  var isloading = true.obs;
  var isload = false.obs;
  List photos = [].obs;
  var page = 1.obs;

  getSearchWallpaper(String searchQuery) async {
    try {
      await http.get(
          Uri.parse(
              "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30&page=1"),
          headers: {"Authorization": Strings.photoApi}).then((value) {
        //print(value.body);

        Map<String, dynamic> jsonData = jsonDecode(value.body);
        jsonData["photos"].forEach((element) {
          Map result = jsonDecode(value.body);

          photos = result['photos'];
          isloading.value = false;

          print(photos);
          //PhotosModel photosModel = new PhotosModel();
          //photosModel = PhotosModel.fromMap(element);
          //photos.add(photosModel);
          //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
        });
      });
    } catch (Exceptioon) {
      print(Exceptioon);
    }
  }

  loadmore(String searchQuery) async {
    isload.value = true;
    page.value = page.value + 1;

    String url =
        'https://api.pexels.com/v1/search?query=$searchQuery&per_page=30&page=' +
            page.value.toString();
    await http.get(Uri.parse(url),
        headers: {'Authorization': Strings.photoApi}).then((value) {
      Map result = jsonDecode(value.body);

      photos.addAll(result['photos']);
      isload.value = false;
    });
  }
}
