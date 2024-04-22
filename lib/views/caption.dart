import 'package:flutter/material.dart';
import 'package:upload_flow/utils/colors.dart';

class Caption extends StatefulWidget {
  const Caption({super.key});

  @override
  State<Caption> createState() => _CaptionState();
}

class _CaptionState extends State<Caption> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 8),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Caption',
            hintStyle: Textcolor.fontsizecolor,
            labelStyle: TextStyle(color: Colors.black),
            alignLabelWithHint: true,
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            border: InputBorder.none),
        maxLines: null,
        minLines: 5,
      ),
    );
  }
}
