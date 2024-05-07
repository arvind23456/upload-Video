import 'package:flutter/material.dart';

class Search_Friend extends StatefulWidget {
  const Search_Friend({super.key});

  @override
  State<Search_Friend> createState() => _Search_FriendState();
}

class _Search_FriendState extends State<Search_Friend> {
  var Friends = [
    'FlorianTales',
    'Graver_Merchant',
    'Jacob Hillßpike',
    'KapturetheLight',
    'Arvind',
    'Olivi0Smith',
    "Gracia B.",
    'Mason 3illiam',
    'Evelyn_erchanr',
    'Liam23Jones'
  ];

  var FilterList = [];
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  void searchFilter(String value) {
    setState(() {
      FilterList = Friends.where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        if (searchController.text.isNotEmpty) {
          isSearching = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text('Search for Friends'),
        titleSpacing: 0.2,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  searchFilter(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search for User',
                  filled: true,
                  contentPadding: const EdgeInsets.all(8),
                  fillColor: const Color.fromRGBO(248, 248, 251, 1),
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
            if (FilterList.isEmpty && isSearching)
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: Text(
                    'User not found',
                    style: TextStyle(color: Colors.black54, fontSize: 27),
                  ),
                ),
              )
            else
              ListView.builder(
                itemCount: FilterList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pop(context, FilterList[index]);
                    },
                    contentPadding: const EdgeInsets.all(9),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/$index.jpg'),
                      radius: 35,
                    ),
                    title: Text(Friends[index]),
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
