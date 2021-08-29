import 'package:flutter/material.dart';


class StyleTextConst extends StatelessWidget {

  final String text;
  final double size;

  const StyleTextConst({Key key, this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(
        fontSize: size,
        color: Colors.white70,
        fontFamily: "LCChalk"
    ),
    );
  }
}

