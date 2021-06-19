import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class PhotoPage extends StatefulWidget {
  late String name;
  late String rollno;
  late String topic;
  final String url1;
  final String url2;
  final String college;
  final String phone;
  final String branch;
  PhotoPage({
    Key? key,
    required this.name,
    required this.rollno,
    required this.topic,
    required this.url1,
    required this.url2,
    required this.college,
    required this.phone,
    required this.branch,
  }) : super(key: key);
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    String top = widget.topic;
    String nam = widget.name;
    String roll = widget.rollno;
    String url1 = widget.url1;
    String url2 = widget.url2;
    String college = widget.college;
    String branch = widget.branch;
    return Scaffold(
      appBar: AppBar(
        title: Text('Photography'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 12,
              child: ClipRect(
                child: PhotoView(
                  imageProvider: NetworkImage(
                    url1,
                  ),
                  minScale: PhotoViewComputedScale.contained * 0.2,
                  maxScale: PhotoViewComputedScale.covered * 4,
                  enableRotation: false,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Image 1',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            AspectRatio(
              aspectRatio: 16 / 12,
              child: ClipRect(
                child: PhotoView(
                  imageProvider: NetworkImage(
                    url2,
                  ),
                  minScale: PhotoViewComputedScale.contained * 0.2,
                  maxScale: PhotoViewComputedScale.covered * 4,
                  enableRotation: false,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Image 2',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 330,
              height: 97,
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Text(
                        nam,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                        decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ) // green shaped
                            ),
                        child: Text("Name"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 330,
              height: 97,
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Text(
                        top,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                        decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ) // green shaped
                            ),
                        child: Text("Topic"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 330,
              height: 97,
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Text(
                        roll,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                        decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ) // green shaped
                            ),
                        child: Text("Roll No."),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 330,
              height: 97,
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Text(
                        college,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                        decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ) // green shaped
                            ),
                        child: Text("College"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
