import 'package:flutter/material.dart';
import 'package:gif_api/API/ApiData.dart';
import 'package:gif_api/Widgets/GifCards.dart';
import 'package:gif_api/Screens/HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(GifApi());
}

class GifApi extends StatefulWidget {
  @override
  State<GifApi> createState() => _GifApiState();
}

class _GifApiState extends State<GifApi> {

  ApiData apiData = ApiData();
//-----------------------------------init state---------------------------------------------------------
  @override
  void initState() {
    apiData.getGIFsData("familyguy");
   super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Gif Api App",
          ),
        ),
        body:HomePage(),
      ),
    );
  }
}
