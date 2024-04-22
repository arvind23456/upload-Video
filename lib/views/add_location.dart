import 'package:flutter/material.dart';

import 'package:upload_flow/utils/icons.dart';
import 'package:upload_flow/views/search_location.dart';

class Add_Location extends StatefulWidget {
  const Add_Location({super.key});

  @override
  State<Add_Location> createState() => _Add_LocationState();
}

class _Add_LocationState extends State<Add_Location> {
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Logoicon.location,
      title: Align(
        alignment: Alignment.topLeft,
        child: TextButton(
            onPressed: () async {
              final city = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search_Location(),
                  ));
              setState(() {
                if (city != null) selectedCity = city;
                print(selectedCity);
              });
            },
            child: Text(selectedCity ?? 'Add Location',
                style: TextStyle(
                  fontSize: 20,
                  color: selectedCity == null
                      ? Color.fromRGBO(130, 127, 127, 1)
                      : Colors.blue,
                ))),
      ),
    );
  }
}
