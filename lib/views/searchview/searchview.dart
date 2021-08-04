import 'package:api_integration/commonWdgets/brandName.dart';
import 'package:api_integration/views/fullscreen/fullscreen.dart';
import 'package:api_integration/views/fullscreen/fullscreen_binding.dart';
import 'package:api_integration/views/searchview/searchview_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  final String? search;

  SearchView({@required this.search});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  // ignore: unused_field
  //bool _isloading = true;
  //var photos = [];
  TextEditingController searchController =
      new TextEditingController(text: Get.arguments);

  //static get search => null;

  // getSearchWallpaper(String searchQuery) async {
  //   await http.get(
  //       Uri.parse(
  //           "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30&page=1"),
  //       headers: {"Authorization": Strings.photoApi}).then((value) {
  //     //print(value.body);

  //     Map<String, dynamic> jsonData = jsonDecode(value.body);
  //     jsonData["photos"].forEach((element) {
  //       Map result = jsonDecode(value.body);
  //       setState(() {
  //         photos = result['photos'];
  //         _isloading = false;
  //       });

  //       //print(element);
  //       //PhotosModel photosModel = new PhotosModel();
  //       //photosModel = PhotosModel.fromMap(element);
  //       //photos.add(photosModel);
  //       //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
  //     });

  //     setState(() {});
  //   });
  // }

  @override
  void initState() {
    //getSearchWallpaper(widget.search!);
    Get.find<SearchViewController>()
        .getSearchWallpaper(widget.search.toString());

    //searchController.text = widget.search!;
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
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Color(0xfff5f8fd),
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            //   margin: EdgeInsets.symmetric(horizontal: 24),
            //   padding: EdgeInsets.symmetric(horizontal: 24),
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //           child: TextField(
            //         controller: searchController,
            //         decoration: InputDecoration(
            //             hintText: "search wallpapers",
            //             border: InputBorder.none),
            //       )),
            //       InkWell(
            //           onTap: () {
            //             Get.find<SearchViewController>()
            //                 .getSearchWallpaper(searchController.text);
            //           },
            //           child: Container(child: Icon(Icons.search)))
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            Obx(
              () => Expanded(
                  child: Get.find<SearchViewController>().isloading == false
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
                                          imageurl:
                                              Get.find<SearchViewController>()
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
            ),
            //wallPaper(photos, context),
          ],
        ),
      ),
    );
  }
}





















// import 'package:api_integration/commonWdgets/brandName.dart';
// import 'package:api_integration/views/fullscreen/fullscreen.dart';
// import 'package:api_integration/views/fullscreen/fullscreen_binding.dart';
// import 'package:api_integration/views/searchview/searchview_controller.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SearchView extends StatefulWidget {
//   final String? search;

//   SearchView({@required this.search});

//   @override
//   _SearchViewState createState() => _SearchViewState();
// }

// class _SearchViewState extends State<SearchView> {
//   // bool _isloading = true;
//   // var photos = [];
//   TextEditingController searchController = new TextEditingController();

//   // getSearchWallpaper(String searchQuery) async {
//   //   await http.get(
//   //       Uri.parse(
//   //           "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30&page=1"),
//   //       headers: {"Authorization": Strings.photoApi}).then((value) {
//   //     //print(value.body);

//   //     Map<String, dynamic> jsonData = jsonDecode(value.body);
//   //     jsonData["photos"].forEach((element) {
//   //       Map result = jsonDecode(value.body);
//   //       setState(() {
//   //         photos = result['photos'];
//   //         _isloading = false;
//   //       });

//   //       //print(element);
//   //       //PhotosModel photosModel = new PhotosModel();
//   //       //photosModel = PhotosModel.fromMap(element);
//   //       //photos.add(photosModel);
//   //       //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
//   //     });

//   //     setState(() {});
//   //   });
//   // }

//   @override
//   void initState() {
//     SearchViewController().getSearchWallpaper(widget.search!);
//     searchController.text = widget.search!;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black26,
//         title: BrandName(),
//         centerTitle: true,
//         elevation: 0.0,
//       ),
//       backgroundColor: Colors.white,
//       body: Obx(
//         () => Container(
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 16,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color(0xfff5f8fd),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 margin: EdgeInsets.symmetric(horizontal: 24),
//                 padding: EdgeInsets.symmetric(horizontal: 24),
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                         child: TextField(
//                       controller: searchController,
//                       decoration: InputDecoration(
//                           hintText: "search wallpapers",
//                           border: InputBorder.none),
//                     )),
//                     InkWell(
//                         onTap: () {
//                           Get.find<SearchViewController>()
//                               .getSearchWallpaper(searchController.text);
//                         },
//                         child: Container(child: Icon(Icons.search)))
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Expanded(
//                   child: Get.find<SearchViewController>().isloading.value ==
//                           false
//                       ? Container(
//                           child: GridView.builder(
//                               itemCount: Get.find<SearchViewController>()
//                                   .photos
//                                   .length,
//                               shrinkWrap: true,
//                               padding: EdgeInsets.symmetric(horizontal: 16),
//                               physics: ClampingScrollPhysics(),
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisSpacing: 2,
//                                       crossAxisCount: 3,
//                                       childAspectRatio: 2 / 3,
//                                       mainAxisSpacing: 2),
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                   onTap: () {
//                                     Get.to(
//                                         FullScreen(
//                                           imageurl:
//                                               Get.find<SearchViewController>()
//                                                       .photos[index]['src']
//                                                   ['large2x'],
//                                         ),
//                                         binding: FullScreenBinding());
//                                   },
//                                   child: Container(
//                                     color: Colors.white,
//                                     child: Image.network(
//                                       Get.find<SearchViewController>()
//                                           .photos[index]['src']['tiny'],
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 );
//                               }),
//                         )
//                       : Center(
//                           child: CircularProgressIndicator(),
//                         )),
//               //wallPaper(photos, context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }























// import 'dart:convert';
// import 'package:api_integration/commonWdgets/brandName.dart';
// import 'package:api_integration/constants/strings.dart';
// import 'package:api_integration/views/fullscreen/fullscreen.dart';
// import 'package:api_integration/views/fullscreen/fullscreen_binding.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class SearchView extends StatefulWidget {
//   final String? search;

//   SearchView({@required this.search});

//   @override
//   _SearchViewState createState() => _SearchViewState();
// }

// class _SearchViewState extends State<SearchView> {
//   bool _isloading = true;
//   var photos = [];
//   TextEditingController searchController = new TextEditingController();

//   getSearchWallpaper(String searchQuery) async {
//     await http.get(
//         Uri.parse(
//             "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30&page=1"),
//         headers: {"Authorization": Strings.photoApi}).then((value) {
//       //print(value.body);

//       Map<String, dynamic> jsonData = jsonDecode(value.body);
//       jsonData["photos"].forEach((element) {
//         Map result = jsonDecode(value.body);
//         setState(() {
//           photos = result['photos'];
//           _isloading = false;
//         });

//         //print(element);
//         //PhotosModel photosModel = new PhotosModel();
//         //photosModel = PhotosModel.fromMap(element);
//         //photos.add(photosModel);
//         //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
//       });

//       setState(() {});
//     });
//   }

//   @override
//   void initState() {
//     getSearchWallpaper(widget.search!);
//     searchController.text = widget.search!;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black26,
//         title: BrandName(),
//         centerTitle: true,
//         elevation: 0.0,
//       ),
//       backgroundColor: Colors.white,
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 16,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: Color(0xfff5f8fd),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               margin: EdgeInsets.symmetric(horizontal: 24),
//               padding: EdgeInsets.symmetric(horizontal: 24),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                       child: TextField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                         hintText: "search wallpapers",
//                         border: InputBorder.none),
//                   )),
//                   InkWell(
//                       onTap: () {
//                         getSearchWallpaper(searchController.text);
//                       },
//                       child: Container(child: Icon(Icons.search)))
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Expanded(
//                 child: _isloading == false
//                     ? Container(
//                         child: GridView.builder(
//                             itemCount: photos.length,
//                             shrinkWrap: true,
//                             padding: EdgeInsets.symmetric(horizontal: 16),
//                             physics: ClampingScrollPhysics(),
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisSpacing: 2,
//                                     crossAxisCount: 3,
//                                     childAspectRatio: 2 / 3,
//                                     mainAxisSpacing: 2),
//                             itemBuilder: (context, index) {
//                               return InkWell(
//                                 onTap: () {
//                                   Get.to(
//                                       FullScreen(
//                                         imageurl: photos[index]['src']
//                                             ['large2x'],
//                                       ),
//                                       binding: FullScreenBinding());
//                                 },
//                                 child: Container(
//                                   color: Colors.white,
//                                   child: Image.network(
//                                     photos[index]['src']['tiny'],
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               );
//                             }),
//                       )
//                     : Center(
//                         child: CircularProgressIndicator(),
//                       )),
//             //wallPaper(photos, context),
//           ],
//         ),
//       ),
//     );
//   }
// }





















// // import 'package:api_integration/commonWdgets/brandName.dart';
// // import 'package:api_integration/views/fullscreen/fullscreen.dart';
// // import 'package:api_integration/views/fullscreen/fullscreen_binding.dart';
// // import 'package:api_integration/views/searchview/searchview_controller.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // class SearchView extends StatefulWidget {
// //   final String? search;

// //   SearchView({@required this.search});

// //   @override
// //   _SearchViewState createState() => _SearchViewState();
// // }

// // class _SearchViewState extends State<SearchView> {
// //   // bool _isloading = true;
// //   // var photos = [];
// //   TextEditingController searchController = new TextEditingController();

// //   // getSearchWallpaper(String searchQuery) async {
// //   //   await http.get(
// //   //       Uri.parse(
// //   //           "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30&page=1"),
// //   //       headers: {"Authorization": Strings.photoApi}).then((value) {
// //   //     //print(value.body);

// //   //     Map<String, dynamic> jsonData = jsonDecode(value.body);
// //   //     jsonData["photos"].forEach((element) {
// //   //       Map result = jsonDecode(value.body);
// //   //       setState(() {
// //   //         photos = result['photos'];
// //   //         _isloading = false;
// //   //       });

// //   //       //print(element);
// //   //       //PhotosModel photosModel = new PhotosModel();
// //   //       //photosModel = PhotosModel.fromMap(element);
// //   //       //photos.add(photosModel);
// //   //       //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
// //   //     });

// //   //     setState(() {});
// //   //   });
// //   // }

// //   @override
// //   void initState() {
// //     SearchViewController().getSearchWallpaper(widget.search!);
// //     searchController.text = widget.search!;
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.black26,
// //         title: BrandName(),
// //         centerTitle: true,
// //         elevation: 0.0,
// //       ),
// //       backgroundColor: Colors.white,
// //       body: Obx(
// //         () => Container(
// //           child: Column(
// //             children: <Widget>[
// //               SizedBox(
// //                 height: 16,
// //               ),
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: Color(0xfff5f8fd),
// //                   borderRadius: BorderRadius.circular(30),
// //                 ),
// //                 margin: EdgeInsets.symmetric(horizontal: 24),
// //                 padding: EdgeInsets.symmetric(horizontal: 24),
// //                 child: Row(
// //                   children: <Widget>[
// //                     Expanded(
// //                         child: TextField(
// //                       controller: searchController,
// //                       decoration: InputDecoration(
// //                           hintText: "search wallpapers",
// //                           border: InputBorder.none),
// //                     )),
// //                     InkWell(
// //                         onTap: () {
// //                           Get.find<SearchViewController>()
// //                               .getSearchWallpaper(searchController.text);
// //                         },
// //                         child: Container(child: Icon(Icons.search)))
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 30,
// //               ),
// //               Expanded(
// //                   child: Get.find<SearchViewController>().isloading.value ==
// //                           false
// //                       ? Container(
// //                           child: GridView.builder(
// //                               itemCount: Get.find<SearchViewController>()
// //                                   .photos
// //                                   .length,
// //                               shrinkWrap: true,
// //                               padding: EdgeInsets.symmetric(horizontal: 16),
// //                               physics: ClampingScrollPhysics(),
// //                               gridDelegate:
// //                                   SliverGridDelegateWithFixedCrossAxisCount(
// //                                       crossAxisSpacing: 2,
// //                                       crossAxisCount: 3,
// //                                       childAspectRatio: 2 / 3,
// //                                       mainAxisSpacing: 2),
// //                               itemBuilder: (context, index) {
// //                                 return InkWell(
// //                                   onTap: () {
// //                                     Get.to(
// //                                         FullScreen(
// //                                           imageurl:
// //                                               Get.find<SearchViewController>()
// //                                                       .photos[index]['src']
// //                                                   ['large2x'],
// //                                         ),
// //                                         binding: FullScreenBinding());
// //                                   },
// //                                   child: Container(
// //                                     color: Colors.white,
// //                                     child: Image.network(
// //                                       Get.find<SearchViewController>()
// //                                           .photos[index]['src']['tiny'],
// //                                       fit: BoxFit.cover,
// //                                     ),
// //                                   ),
// //                                 );
// //                               }),
// //                         )
// //                       : Center(
// //                           child: CircularProgressIndicator(),
// //                         )),
// //               //wallPaper(photos, context),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
