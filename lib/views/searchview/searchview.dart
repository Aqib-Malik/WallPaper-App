import 'package:api_integration/commonWdgets/brandName.dart';
import 'package:api_integration/views/fullscreen/fullscreen.dart';
import 'package:api_integration/views/fullscreen/fullscreen_binding.dart';
import 'package:api_integration/views/searchview/searchview_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  final String? search;

  SearchView({@required this.search});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController =
      new TextEditingController(text: Get.arguments);

  @override
  void initState() {
    Get.find<SearchViewController>()
        .getSearchWallpaper(widget.search.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: BrandName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => Stack(
          children: [
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                      child: Get.find<SearchViewController>().isloading.value ==
                              false
                          ? Container(
                              child: GridView.builder(
                                  itemCount: Get.find<SearchViewController>()
                                      .photos
                                      .length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  physics: ClampingScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 2,
                                          crossAxisCount: 3,
                                          childAspectRatio: 2 / 3,
                                          mainAxisSpacing: 2),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Get.to(
                                            FullScreen(
                                              imageurl: Get.find<
                                                          SearchViewController>()
                                                      .photos[index]['src']
                                                  ['large2x'],
                                            ),
                                            binding: FullScreenBinding());
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        child: Image.network(
                                          Get.find<SearchViewController>()
                                              .photos[index]['src']['tiny'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            )),
                ],
              ),
            ),
            Positioned(
                bottom: 20,
                left: 38,
                child: Container(
                    height: 50.0,
                    margin: EdgeInsets.all(10),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        Get.find<SearchViewController>()
                            .loadmore(widget.search.toString());
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child:
                              Get.find<SearchViewController>().isload.value ==
                                      false
                                  ? Text(
                                      'Load More',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Loading..",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        SpinKitFadingCircle(
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                      ],
                                    ),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
