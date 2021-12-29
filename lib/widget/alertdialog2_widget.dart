import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopus/constant.dart';
import 'package:loopus/screen/report_screen.dart';

class Alertdialog2Widget extends StatelessWidget {
  var color_1;
  var color_2;
  String? text_1;
  String? text_2;
  Function()? route_1;
  Function() route_2;

  Alertdialog2Widget(
      {this.color_1,
      this.color_2,
      this.text_1,
      this.text_2,
      this.route_1,
      required this.route_2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        elevation: 0.0,
        // title: Center(child: Text("Evaluation our APP")),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: Get.width * 0.95,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        route_1!();
                        print("click1");
                      },
                      child: (Container(
                          width: Get.width * 0.95,
                          height: 30,
                          child: Center(
                              child: Text(
                            text_1!,
                            style: TextStyle(
                                color: color_1 ?? mainblack,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ))))),
                  Divider(
                    thickness: 2,
                    color: mainlightgrey,
                  ),
                  InkWell(
                      onTap: () {
                        route_2();
                        print("click2");
                      },
                      child: (Container(
                          width: Get.width * 0.95,
                          height: 30,
                          child: Center(
                              child: Text(
                            text_2!,
                            style: TextStyle(
                                color: color_2,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ))))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: Center(
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: (Container(
                        width: Get.width * 0.95,
                        height: 30,
                        child: Center(
                            child: Text(
                          "닫기",
                          style: TextStyle(fontSize: 14),
                        ))))),
              ),
            )
          ],
        ));
  }
}