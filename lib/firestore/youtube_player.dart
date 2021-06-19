import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class YtPage extends StatefulWidget {
  late String name;
  late String rollno;
  late String topic;
  final String url;
  final String college;
  YtPage({
    Key? key,
    required this.name,
    required this.rollno,
    required this.topic,
    required this.url,
    required this.college,
  }) : super(key: key);
  @override
  _YtPageState createState() => _YtPageState();
}

class _YtPageState extends State<YtPage> {
  late YoutubePlayerController _controller;
  // String purl = url;
  String getVideoID(String url) {
    print(url.length);
    if (url.length >= 43) {
      url = url.substring(0, 43);
    }
    url = url.replaceAll("https://www.youtube.com/watch?v=", "");
    url = url.replaceAll("https://m.youtube.com/watch?v=", "");
    url = url.replaceAll("https://youtu.be/", "");
    return url;
  }

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: getVideoID(widget.url),
      flags: YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: false,
        isLive: false,
      ),
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String top = widget.topic;
    String nam = widget.name;
    String roll = widget.rollno;
    String clg = widget.college;
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              // title: Text("Uploads"),
              // centerTitle: true,
              // backgroundColor: Colors.red,
              backgroundColor: Color(0xff5a65ff),
              title: new Text(
                'Uploads',
                textAlign: TextAlign.center,
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  player,
                  SizedBox(
                    height: 40,
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
                              nam.toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 6),
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
                              top.toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 6),
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
                              roll.toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 6),
                              decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ) // green shaped
                                  ),
                              child: Text("Roll Number"),
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
                              clg.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 6),
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
        });
  }
}
