import 'package:api_integration/commonWdgets/brandName.dart';
import 'package:api_integration/commonWdgets/customWidgets.dart';
//import 'package:api_integration/views/fullscreen/fulScreenController.dart';
import 'package:api_integration/views/fullscreen/fullscreen.dart';
import 'package:api_integration/views/fullscreen/fullscreen_binding.dart';
import 'package:api_integration/views/home2/hom2Controller.dart';
import 'package:api_integration/views/searchview/searchview.dart';
import 'package:api_integration/views/searchview/searchview_binding.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Wallpaperr extends StatefulWidget {
  @override
  _WallpaperrState createState() => _WallpaperrState();
}

class _WallpaperrState extends State<Wallpaperr> {
  //Home2Controller _homeController = Get.put(Home2Controller());
  //RxList<String> items = RxList<String>();

  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        //backgroundColor: Colors.black26,
        title: BrandName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              Column(
                children: [
                  //BrandName(),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff5f8fd),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: new TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                              hintText: "search wallpapers",
                              border: InputBorder.none),
                        )),
                        InkWell(
                            onTap: () {
                              String searchText = searchController.text;
                              searchController.text = "";
                              if (searchText != "") {
                                Get.to(
                                    SearchView(
                                      search: searchText,
                                    ),
                                    binding: SearchViewBinding());
                              } else {
                                CustomWidget.SnackBarr("Empty Field",
                                    "Please enter a value that you want to search");
                              }
                            },
                            child: Container(child: Icon(Icons.search)))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Container(
                      child: Get.find<Home2Controller>().isloading.value ==
                              false
                          ? Container(
                              margin: EdgeInsets.all(12),
                              child: new StaggeredGridView.countBuilder(
                                //crossAxisCount: 4,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 12,
                                itemCount:
                                    Get.find<Home2Controller>().images.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    new InkWell(
                                        onTap: () {
                                          Get.to(
                                            FullScreen(
                                              imageurl:
                                                  Get.find<Home2Controller>()
                                                          .images[index]['src']
                                                      ['large2x'],
                                            ),
                                            binding: FullScreenBinding(),
                                            arguments:
                                                Get.find<Home2Controller>()
                                                        .images[index]['src']
                                                    ['large2x'],
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black38,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),

                                          //color: Colors.white,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  Get.find<Home2Controller>()
                                                          .images[index]['src']
                                                      ['tiny'],
                                              fit: BoxFit.cover,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      Center(
                                                child: SpinKitCubeGrid(
                                                  color: Colors.white,
                                                  //size: 50.0,
                                                ),

                                                //

                                                //CircularProgressIndicator(
                                                //   //strokeWidth: 2,
                                                //   value: downloadProgress.progress,
                                                // ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                          ),

                                          // Image.network(
                                          //   images[index]['src']['tiny'],
                                          //   fit: BoxFit.cover,
                                          // ),
                                        )),
                                staggeredTileBuilder: (int index) =>
                                    new StaggeredTile.count(
                                        1, index.isEven ? 1.2 : 1.8),
                              ),
                            )
                          : Center(
                              child: SpinKitChasingDots(
                                color: Colors.white,
                                size: 50.0,
                              ),
                            ),
                    ),
                  ),
                ],
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
                          Get.find<Home2Controller>().loadmore();
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
                            constraints: BoxConstraints(
                                maxWidth: 250.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Get.find<Home2Controller>().isload.value ==
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
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      SpinKitFadingCircle(
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ],
                                  ),
                            // Text(
                            //   text.toString(),
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(color: Colors.white, fontSize: 15),
                            // ),
                            //),
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
