import 'package:flutter/material.dart';

class LoadMore extends StatelessWidget {
  final Function onLoadMore;

  LoadMore({Key key, this.onLoadMore}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              color: Colors.white,
              size: 70.0,
            ),
            Text(
              "Carregar mais...",
              style: TextStyle(color: Colors.white, fontSize: 22.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        onTap: onLoadMore,
      ),
    );
  }
}
