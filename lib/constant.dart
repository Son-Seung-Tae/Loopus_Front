import 'package:flutter/material.dart';
import 'dart:io';

// Colors
const mainWhite = Color(0xFFFFFFFF);
const mainblue = Colors.pink;
const mainpink = Colors.pinkAccent;
const subPink = Color(0x9FFFABA4);
//const mainBackground = Color(0xFF202020);
const mainBackground = Colors.black;
const mainFontDark = Colors.black87;
const subGray = Color(0xFFFAFAFB);
const downDark = Color(0x66000000);
var lightGray = Colors.grey[400];
//

//Text StyleSheet
var kAppBarTitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: mainWhite,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

//Home Style
var kHomeTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: mainWhite,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kHomeGanreStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: mainWhite,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kHomeContentStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: mainWhite,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kTitle2Style = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: mainWhite,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kTitle3Style = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: mainWhite,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kContentStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  color: mainWhite,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kContentSubStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  color: mainWhite,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

var kSearchHintStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: mainWhite,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);
