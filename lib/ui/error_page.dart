import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error_outline,
            size: 60.0,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Ocorreu um erro :(",
              style: TextStyle(
                color: Colors.red,
                fontSize: 25.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
