import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopus/widget/checkboxperson_widget.dart';
import 'package:loopus/widget/searchedtag_widget.dart';
import 'package:loopus/widget/selected_tag_widget.dart';
import 'package:http/http.dart' as http;

class ProjectMakeController extends GetxController {
  static ProjectMakeController get to => Get.find();

  void onInit() {
    super.onInit();
    tagsearch.addListener(() {
      gettagsearch();
    });
  }

  TextEditingController projectnamecontroller = TextEditingController();
  TextEditingController introcontroller = TextEditingController();
  TextEditingController startmonthcontroller = TextEditingController();
  TextEditingController startdaycontroller = TextEditingController();
  TextEditingController finishmonthcontroller = TextEditingController();
  TextEditingController finishdaycontroller = TextEditingController();
  TextEditingController tagsearch = TextEditingController();
  List<SelectedTagWidget> selectedtaglist = <SelectedTagWidget>[
    // SelectedTagWidget(
    //   text: '컴공',
    // )
  ].obs;

  List<SearchTagWidget> searchtaglist = <SearchTagWidget>[].obs;
  List<SelectedTagWidget> selectedpersontaglist = <SelectedTagWidget>[].obs;

  RxBool isongoing = false.obs;
  // List<CheckBoxPersonWidget> looppersonlist = <CheckBoxPersonWidget>[].obs;

  void gettagsearch() async {
    // Uri uri = Uri.parse('http://52.79.75.189:8000/user_api/login/');
    Uri uri = Uri.parse(
        'http://3.35.253.151:8000/tag_api/search?query=${tagsearch.text}');

    http.Response response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    print(response.statusCode);
    var responsebody = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      List responselist = responsebody["results"];
      print(responselist);
      if (responselist.isEmpty) {
        searchtaglist.clear();
        searchtaglist.add(SearchTagWidget(
          tag: "처음으로 '${tagsearch.text}' 태그 사용하기",
        ));
      } else {
        searchtaglist.clear();

        // responselist.forEach((map) => SearchTagWidget(tag: ,));
      }
    } else if (response.statusCode == 401) {
      // Get.defaultDialog(
      //   title: '로그인 오류',
      //   content: Text('아이디 또는 비밀번호가 틀렸습니다'),
      // );
    } else {
      print(response.statusCode);
    }
  }

  void postmaketag() async {
    // Uri uri = Uri.parse('http://52.79.75.189:8000/user_api/login/');
    Uri uri = Uri.parse('http://3.35.253.151:8000/tag_api/create/');

    var tag = {"tag": tagsearch.text};

    http.Response response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(tag),
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      // String token = jsonDecode(response.body)['Token'];
      // String userid = jsonDecode(response.body)['user_id'];
    } else if (response.statusCode == 401) {
      // Get.defaultDialog(
      //   title: '로그인 오류',
      //   content: Text('아이디 또는 비밀번호가 틀렸습니다'),
      // );
    } else {
      print(response.statusCode);
    }
  }
}
