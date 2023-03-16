import 'package:flutter/material.dart';
import 'package:flutter_profile/components/profile_buttons.dart';
import 'package:flutter_profile/components/profile_count_info.dart';
import 'package:flutter_profile/components/profile_header.dart';
import 'package:flutter_profile/components/profile_tab.dart';
import 'package:flutter_profile/hello_page.dart';
import 'package:flutter_profile/theme.dart';

import 'components/profile_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: profilePage(),
    );
  }
}

class profilePage extends StatelessWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(), // 언더스코어가 붙어 있으면 private 으로 만든거임 !!  자기 패키지에서만 찾을수 있음
      endDrawer: profileDrawer(),
      body: Column(
        children: [
          SizedBox(height: 20,),
          SizedBox(width: 20,),
          profileHeader(),
          profileCountInfo(),
          SizedBox(height: 15,),
          profileButtons(),
          SizedBox(height: 15,),
          Expanded(child: ProfileTap()),
        ],
      ),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    leading: Icon(Icons.arrow_back_ios),
    centerTitle: true,
    title: Text("profile"),
  );
}

