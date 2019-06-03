import 'package:flutter/material.dart';
import 'package:gif_search/ui/gif_tile.dart';
import 'package:gif_search/ui/load_more.dart';

class GifsGrid extends StatelessWidget {
  final Map<dynamic, dynamic> data;
  final bool searching;
  final Function onLoadMore;

  GifsGrid({Key key, this.data, this.searching, this.onLoadMore})
      : super(key: key);

  bool _showLoadMoreWidget(index) {
    return (searching != null) && index >= data["data"].length;
  }

  Widget _buildGifTile(BuildContext context, int index) {
    if (_showLoadMoreWidget(index)) {
      return LoadMore(
        onLoadMore: onLoadMore,
      );
    }
    return GifTile(
      data: data["data"][index],
    );
  }

  int _getCount() {
    if (searching == null) return data["data"].length;
    return data["data"].length + 1;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: _getCount(),
      itemBuilder: _buildGifTile,
    );
  }
}
