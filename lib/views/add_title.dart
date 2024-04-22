import 'package:flutter/material.dart';
import 'package:upload_flow/utils/colors.dart';
import 'package:upload_flow/utils/icons.dart';

class Add_Title extends StatefulWidget {
  const Add_Title({super.key});

  @override
  State<Add_Title> createState() => _Add_TitleState();
}

class _Add_TitleState extends State<Add_Title> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: ListTile(
        leading: Logoicon.title,
        title: const TextField(
            decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: 'Add Title',
          hintStyle: MainScreen.fontsizecolor,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        )),
      ),
    );
  }
}
