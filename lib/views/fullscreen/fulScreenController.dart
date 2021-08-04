import 'package:api_integration/commonWdgets/customWidgets.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';

class FullScreenController extends GetxController {
  var isdownload = false.obs;

  downloadWallpaper(String path) async {
    String a = path;
    try {
      isdownload.value = true;
      //showLoadingDialog(context);
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(a.toString());
      if (imageId == null) {
        print("no image");
        return;
      }
      // Below is a method of obtaining saved image information.
      // ignore: unused_local_variable
      var fileName = await ImageDownloader.findName(imageId);
      // ignore: unused_local_variable
      var path = await ImageDownloader.findPath(imageId);
      // ignore: unused_local_variable
      var size = await ImageDownloader.findByteSize(imageId);
      // ignore: unused_local_variable
      var mimeType = await ImageDownloader.findMimeType(imageId);
      //Navigator.pop(context);
      isdownload.value = false;
      CustomWidget.SnackBarr(
          "Downloaded", "This Wallpaper is save to your Gallery.");
      //showToast('Image downloaded.');
      // ignore: nullable_type_in_catch_clause
    } on Exception catch (error) {
      CustomWidget.SnackBarr("error", error.toString());
    }
  }
}
