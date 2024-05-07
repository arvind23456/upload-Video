import 'package:flutter/material.dart';

import 'package:upload_flow/utils/icons.dart';
import 'package:upload_flow/views/search_location.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        leading: Logoicon.location,
        title: Align(
          alignment: Alignment.topLeft,
          child: TextButton(
              onPressed: () async {
                final city = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchLocation(),
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
                        ? const Color.fromRGBO(130, 127, 127, 1)
                        : Colors.blue,
                  ))),
        ),
      ),
    );
  }
}
