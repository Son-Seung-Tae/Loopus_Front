import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageAnswerWidget extends StatelessWidget {
  String content;
  String name;
  String image;

  MessageAnswerWidget(
      {required this.content, required this.image, required this.name});
  // const MessageQuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // padding: EdgeInsets.fromLTRB(80, 0, 15, 0),
            height: 60,
            width: Get.width * 0.77,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${content}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              ClipOval(
                  child: CachedNetworkImage(
                height: 37,
                width: 37,
                imageUrl: "https://i.stack.imgur.com/l60Hf.png",
                placeholder: (context, url) => CircleAvatar(
                  child: Center(child: CircularProgressIndicator()),
                ),
                fit: BoxFit.fill,
              )),
              SizedBox(
                height: 3,
              ),
              Text(
                "$name",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
