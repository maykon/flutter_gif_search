import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class ShowGif extends StatelessWidget {
  final Map gif;

  ShowGif({Key key, this.gif}) : super(key: key);

  void _onShare() {
    Share.share(gif["images"]["fixed_height"]["url"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gif["title"]),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _onShare,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: FadeInImage.memoryNetwork(
          image: gif["images"]["fixed_height"]["url"],
          height: 300.0,
          placeholder: kTransparentImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
