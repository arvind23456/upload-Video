import 'package:flutter/material.dart';

class Search_Location extends StatefulWidget {
  const Search_Location({super.key});

  @override
  State<Search_Location> createState() => _Search_LocationState();
}

class _Search_LocationState extends State<Search_Location> {
  var arrNames = [
    'Swami Automobiles',
    'RSA Motors',
    'Mahindra & Mahindra',
    'Tata Motors',
    'Hyundai Motor Company',
    'Ford Motor Co.',
    'Swiss Pie',
    'Hometel',
    'Vodafone Group Plc',
    'Reliance Industries Limited',
    'Bharti Airtel',
  ];

  var filterList = [];

  void SearchFilter(String value) {
    setState(() {
      filterList = arrNames
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Search Location'),
        titleSpacing: 0,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                child: TextField(
                  onChanged: (value) {
                    SearchFilter(value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: const Color.fromRGBO(248, 248, 251, 1),
                    hintText: 'Search for Location',
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 34,
                      color: Color.fromRGBO(143, 143, 146, 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(229, 229, 229, 1))),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(229, 229, 229, 1)),
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: filterList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pop(context, filterList[index]);
                  },
                  title: Text(filterList[index]),
                  subtitle: const Text('chandigarh'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
