import 'package:flutter/material.dart';
import 'package:loopus/constant.dart';

class Tagwidget extends StatelessWidget {
  Tagwidget({Key? key, required this.content}) : super(key: key);

  String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 4,
      ),
      decoration: BoxDecoration(
          color: Color(0xffefefef), borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Text(
        "${content}",
        style: TextStyle(
          fontSize: 12,
          color: Color(0xff999999),
        ),
      ),
    );
  }
}
