import 'package:api_integration/commonWdgets/brandName.dart';
import 'package:api_integration/views/fullscreen/fulScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({Key? key, required this.imageurl}) : super(key: key);
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: BrandName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  child: Image.network(widget.imageurl),
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
                    Get.find<FullScreenController>()
                        .downloadWallpaper(widget.imageurl);
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Download",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.download,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
