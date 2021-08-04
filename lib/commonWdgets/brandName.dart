import 'package:flutter/material.dart';

class BrandName extends StatelessWidget {
  const BrandName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "Wallpaper",
          style: TextStyle(
              color: Colors.white, // Colors.black87,
              fontFamily: 'Overpass'),
        ),
        Text(
          "App",
          style: TextStyle(color: Colors.blue, fontFamily: 'Overpass'),
        )
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class CustomWidgets{
//   // Widget dialogBox(){
//   //   return 
//   // }
//   Widget appName(){
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Text(
//           "Wallpaper",
//           style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),
//         ),
//         Text(
//           "App",
//           style: TextStyle(color: Colors.blue, fontFamily: 'Overpass'),
//         )
//       ],
//     );
//   }
// }
