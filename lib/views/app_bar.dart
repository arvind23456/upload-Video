import 'package:flutter/material.dart';

class App_Bar extends StatefulWidget {
  const App_Bar({super.key});

  @override
  State<App_Bar> createState() => _App_BarState();
}

class _App_BarState extends State<App_Bar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 85,
      titleSpacing: 3,
      backgroundColor: Colors.white,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      title: Text('Create Post'),
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Post', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
