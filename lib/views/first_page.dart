import 'package:flutter/material.dart';
import 'package:upload_flow/utils/colors.dart';
import 'package:upload_flow/views/app_bar.dart';
import 'package:upload_flow/views/add_friend.dart';
import 'package:upload_flow/views/add_location.dart';
import 'package:upload_flow/views/add_title.dart';
import 'package:upload_flow/views/caption.dart';
import 'package:upload_flow/views/category_list.dart';
import 'package:upload_flow/views/upload_video.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 251, 251, 1),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: App_Bar(),
      ),
      body: ListView(
        children: const [
          Divider(color: MainScreen.border),
          Add_Location(),
          Divider(color: MainScreen.border),
          Add_Friend(),
          Divider(color: MainScreen.border),
          Add_Title(),
          Divider(color: MainScreen.border),
          Category_List(),
          Divider(color: MainScreen.border),
          Caption(),
          Divider(color: MainScreen.border),
          Upload_Video(),
        ],
      ),
    );
  }
}
