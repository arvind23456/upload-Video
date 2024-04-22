import 'package:flutter/material.dart';

import 'package:upload_flow/utils/icons.dart';

class Category_List extends StatefulWidget {
  const Category_List({super.key});

  @override
  State<Category_List> createState() => _Category_ListState();
}

class _Category_ListState extends State<Category_List> {
  List<String> menu = <String>['Books', 'Gaming', 'Sports Wear', 'Gold'];
  String? dropdownValue;

  List<String> filterlist = [];
  bool showCategoryList = false;

  String? selectedCategory;

  TextEditingController _controller = TextEditingController();

  void searchFilter(String value) {
    setState(() {
      filterlist = menu
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        if (_controller.text.isNotEmpty) {
          showCategoryList = true;
        } else {
          showCategoryList = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Container(
        color: Color.fromRGBO(250, 250, 250, 1),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7, left: 12, top: 18),
                  child: SizedBox(
                    width: 30,
                    child: Logoicon.categorymenu,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15),
                    child: Container(
                      height: 35,
                      color: Color.fromRGBO(250, 250, 250, 1),
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          searchFilter(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Category',
                          //    contentPadding: EdgeInsets.only(bottom: ),
                          suffixIcon: _controller.text.isNotEmpty
                              ? IconButton(
                                  icon: Logoicon.delete,
                                  onPressed: () {
                                    _controller.clear();
                                  },
                                )
                              : null,
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(130, 127, 127, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (showCategoryList) // && selectedCategory != null

              Container(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Color.fromRGBO(241, 239, 239, 1),
                          height: 0,
                        ),
                    shrinkWrap: true,
                    itemCount: filterlist.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filterlist[index],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onTap: () {
                          //  selectedCategory = null;
                          _controller.text = filterlist[index];
                          showCategoryList = false;
                          selectedCategory = filterlist[index];
                        },
                      );
                    }),
              ),
          ],
        ),
      ),
    );
  }
}



/* items: menu.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(value, style: MainScreen.fontsizecolor),
              ),
            );
          }).toList(), */