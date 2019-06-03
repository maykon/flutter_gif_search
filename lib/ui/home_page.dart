import 'package:flutter/material.dart';
import 'package:gif_search/api/api.dart';
import 'package:gif_search/ui/error_page.dart';
import 'package:gif_search/ui/gifs_grid.dart';
import 'package:gif_search/ui/loading.dart';
import 'package:gif_search/ui/search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;

  Widget _buildGrid(
      BuildContext context, AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Loading();
      default:
        if (snapshot.hasError) return ErrorPage();
        return GifsGrid(
          data: snapshot.data,
          searching: _search != null,
          onLoadMore: _onLoadMore,
        );
    }
  }

  void _onLoadMore() {
    setState(() {
      _offset += 19;
    });
  }

  void _onSearch(String text) {
    setState(() {
      _offset = 0;
      if (text.isEmpty) {
        _search = null;
      } else {
        _search = text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Search(
            onSubmitted: _onSearch,
          ),
          Expanded(
            child: FutureBuilder(
              future: getGifs(search: _search, offset: _offset),
              builder: _buildGrid,
            ),
          ),
        ],
      ),
    );
  }
}
