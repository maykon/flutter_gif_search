import 'package:flutter/material.dart';
import 'package:gif_search/ui/show_gif.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GifTile extends StatelessWidget {
  final Map<dynamic, dynamic> data;

  GifTile({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FadeInImage.memoryNetwork(
        image: data["images"]["fixed_height"]["url"],
        height: 300.0,
        placeholder: kTransparentImage,
        fit: BoxFit.cover,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowGif(gif: data),
          ),
        );
      },
      onLongPress: () {
        Share.share(data["images"]["fixed_height"]["url"]);
      },
    );
  }
}
