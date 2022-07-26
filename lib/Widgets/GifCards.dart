import 'package:flutter/material.dart';

class GifCards extends StatelessWidget {

  final String? gifUrl;
  GifCards({this.gifUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(gifUrl.toString()),
      ),
    );
  }
}
