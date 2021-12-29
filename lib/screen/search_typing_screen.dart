import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loopus/constant.dart';
import 'package:loopus/controller/search_controller.dart';
import 'package:loopus/screen/home_screen.dart';
import 'package:underline_indicator/underline_indicator.dart';

class SearchTypingScreen extends StatelessWidget {
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 52,
            centerTitle: false,
            titleSpacing: 0,
            elevation: 0,
            backgroundColor: mainWhite,
            leading: Text(''),
            leadingWidth: 16,
            actions: [
              if (searchController.isFocused.value == true)
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                    print(searchController.tabController.index);
                  },
                  child: Center(
                    child: Text(
                      '취소',
                      style: TextStyle(
                        fontSize: 14,
                        color: mainblack,
                      ),
                    ),
                  ),
                ),
              if (searchController.isFocused.value == false)
                SizedBox(
                  width: 16,
                ),
            ],
            title: Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: searchController.isFocused.value
                    ? MediaQuery.of(context).size.width - 70
                    : MediaQuery.of(context).size.width,
                curve: Curves.easeOut,
                height: 36,
                child: TextField(
                    controller: searchController.searchtextcontroller,
                    onTap: () {
                      searchController.checknonesearch.value = false;
                    },
                    onSubmitted: (value) async {
                      searchController.searchpostinglist.clear();
                      searchController.searchprofilelist.clear();
                      searchController.searchquestionlist.clear();
                      await searchController.search(
                          searchController.tabController.index, value);
                      print(value);
                      searchController.searchtextcontroller.clear();
                    },
                    focusNode: searchController.focusNode,
                    style: TextStyle(color: mainblack, fontSize: 14),
                    cursorColor: Colors.grey,
                    cursorWidth: 1.5,
                    cursorHeight: 14,
                    cursorRadius: Radius.circular(5.0),
                    autofocus: true,
                    // focusNode: searchController.detailsearchFocusnode,
                    textAlign: TextAlign.start,
                    // selectionHeightStyle: BoxHeightStyle.tight,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: mainlightgrey,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8)),
                      // focusColor: Colors.black,
                      // border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.only(right: 16),
                      isDense: true,
                      hintText: "어떤 정보를 찾으시나요?",
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: mainblack.withOpacity(0.6),
                          height: 1.5),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
                        child: SvgPicture.asset(
                          "assets/icons/Search_Inactive.svg",
                          width: 16,
                          height: 16,
                          color: mainblack.withOpacity(0.6),
                        ),
                      ),
                    )),
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () => searchController.focusNode.unfocus(),
            child: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Theme(
                          data: ThemeData().copyWith(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: TabBar(
                              controller: searchController.tabController,
                              labelStyle: TextStyle(
                                color: mainblack,
                                fontSize: 14,
                                fontFamily: 'Nanum',
                                fontWeight: FontWeight.bold,
                              ),
                              labelColor: mainblack,
                              unselectedLabelStyle: TextStyle(
                                color: Colors.yellow,
                                fontSize: 14,
                                fontFamily: 'Nanum',
                                fontWeight: FontWeight.normal,
                              ),
                              unselectedLabelColor: mainblack.withOpacity(0.6),
                              indicator: UnderlineIndicator(
                                  strokeCap: StrokeCap.round,
                                  borderSide: BorderSide(width: 2),
                                  insets:
                                      EdgeInsets.symmetric(horizontal: 10.0)),
                              isScrollable: false,
                              indicatorColor: mainblack,
                              tabs: [
                                Tab(
                                  height: 40,
                                  child: Text(
                                    "포스팅",
                                  ),
                                ),
                                Tab(
                                  height: 40,
                                  child: Text(
                                    "프로필",
                                  ),
                                ),
                                Tab(
                                  height: 40,
                                  child: Text(
                                    "질문",
                                  ),
                                ),
                                Tab(
                                  height: 40,
                                  child: Text(
                                    "태그",
                                  ),
                                ),
                                Tab(
                                  height: 40,
                                  child: Text(
                                    "공고",
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          height: 1,
                          color: Color(0xffe7e7e7),
                        )
                      ],
                    ),
                  ),
                  // SliverToBoxAdapter(child: de\,)
                ];
              },
              body: TabBarView(
                  physics: PageScrollPhysics().parent,
                  controller: searchController.tabController,
                  children: [
                    SingleChildScrollView(
                      child: Obx(
                          () => searchController.checknonesearch.value == false
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children:
                                        searchController.searchpostinglist,
                                  ))
                              : Container(
                                  height: 80,
                                  child: Center(
                                      child: Text(
                                    "검색 결과가 존재하지 않습니다.",
                                    style: kSubTitle2Style,
                                  )))),
                    ),
                    SingleChildScrollView(
                      child: Obx(
                          () => searchController.checknonesearch.value == false
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children:
                                        searchController.searchprofilelist,
                                  ))
                              : Container(
                                  height: 80,
                                  child: Center(
                                      child: Text(
                                    "검색 결과가 존재하지 않습니다.",
                                    style: kSubTitle2Style,
                                  )))),
                    ),
                    SingleChildScrollView(
                      child: Obx(
                          () => searchController.checknonesearch.value == false
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children:
                                        searchController.searchquestionlist,
                                  ),
                                )
                              : Container(
                                  height: 80,
                                  child: Center(
                                      child: Text(
                                    "검색 결과가 존재하지 않습니다.",
                                    style: kSubTitle2Style,
                                  )))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Center(child: Text("태그")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Center(child: Text("공고")),
                    ),
                  ]),
            ),
          )),
    );
  }
}