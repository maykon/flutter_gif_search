import 'package:flutter/material.dart';
import 'package:gif_search/ui/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Gif",
    home: HomePage(),
    theme: ThemeData(
      hintColor: Colors.white,
    ),
    debugShowCheckedModeBanner: false,
  ));
}
