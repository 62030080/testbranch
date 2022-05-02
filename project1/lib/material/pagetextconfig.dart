import 'package:flutter/material.dart';

class TextConfigStl extends StatelessWidget {
  String in_text;
  double in_fontsize;
  TextConfigStl(this.in_text, this.in_fontsize);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(10.0),
      child: Text(in_text,style: TextStyle(fontSize: in_fontsize),),
    );
  }
}

