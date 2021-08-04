import 'package:api_integration/views/home2/hom2.dart';
import 'package:api_integration/views/home2/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      title: 'WallPaper App',
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.black26),
      //home: Wallpaperr(), //Wallpaper(), //Wallpaper(),//(),

      home: Wallpaperr(),
    );
  }
}
