// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'package:upload_flow/utils/colors.dart';
import 'package:upload_flow/utils/icons.dart';
import 'package:upload_flow/views/search_friend.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Add_Friend extends StatefulWidget {
  const Add_Friend({super.key});

  @override
  State<Add_Friend> createState() => _Add_FriendState();
}

class _Add_FriendState extends State<Add_Friend> {
  List<String> selectedFriend = [];

  void showToast() {
    Fluttertoast.showToast(
        msg: "User already selected", backgroundColor: Colors.black54);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (selectedFriend.isEmpty)
          ListTile(
            leading: Logoicon.tag,
            title: Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                  onPressed: () async {
                    final friend = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Search_Friend(),
                        ));
                    setState(() {
                      selectedFriend.add(friend);
                    });
                    print(selectedFriend);
                  },
                  child:
                      const Text('Tag Users', style: MainScreen.fontsizecolor)),
            ),
          ),
        if (selectedFriend.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Logoicon.tag,
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  child: Container(
                    width: 305,
                    child: GridView.builder(
                      itemCount: selectedFriend.length + 1,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 37,
                              childAspectRatio: 20),
                      itemBuilder: (context, index) {
                        if ((index == selectedFriend.length)) {
                          return Container(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(left: 7)),
                              onPressed: () async {
                                final friend = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Search_Friend(),
                                  ),
                                );
                                if (!selectedFriend.contains(friend)) {
                                  setState(() {
                                    selectedFriend.add(friend);
                                  });
                                } else {
                                  showToast();
                                }
                              },
                              child: Container(
                                height: 27,
                                width: 98,
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Add more ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1, color: Colors.pink),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 92,
                                            height: 26,
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                selectedFriend[index],
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedFriend.removeAt(index);
                                            });
                                          },
                                          child: Logoicon.cross,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
