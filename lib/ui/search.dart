import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final Function onSubmitted;

  Search({Key key, this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Pesquise aqui!",
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.white, fontSize: 18.0),
        textAlign: TextAlign.center,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
