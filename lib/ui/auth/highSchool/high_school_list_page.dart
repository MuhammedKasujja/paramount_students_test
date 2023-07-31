import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';
import 'package:paramount_students/models/high_school_model/high_school_model.dart';
import 'package:paramount_students/ui/auth/highSchool/add_high_school_widget.dart';

class HighSchoolListPage extends StatefulWidget {
  final List<HighSchoolModel> requiredList;
  const HighSchoolListPage({
    Key? key,
    required this.requiredList,
  }) : super(key: key);

  @override
  State<HighSchoolListPage> createState() => _HighSchoolListPageState();
}

class _HighSchoolListPageState extends State<HighSchoolListPage> {
  List<HighSchoolModel> items = [];

  List<String> searchList = [];

  int selectedIndex = 0;

  @override
  void initState() {
    setState(() {
      items = widget.requiredList;
    });

    if (items.isNotEmpty) {
      for (var itemsElements in items) {
        searchList.add(itemsElements.name!);
      }
    }
    super.initState();
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<HighSchoolModel> listData = [];
      for (var searchListElement in searchList) {
        if (searchListElement.contains(query)) {
          for (var itemCompareElement in items) {
            if (itemCompareElement.name == searchListElement) {
              listData.add(itemCompareElement);
            }
          }
        }
      }
      setState(() {
        items.clear();
        items.addAll(listData);
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('items list : $items');
    debugPrint('items receives : ${widget.requiredList}');
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                Navigator.pop(context, items.isNotEmpty ? items[0] : {});
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.clear),
                  const SizedBox(
                    width: 5,
                  ),
                  sText("Cancel", size: 12)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            sText(
              'High School Name',
              size: 30,
              weight: FontWeight.w500,
              color: Colors.black,
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: textDecorNoBorder(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    fill: Colors.grey[100],
                    hint: "Search",
                    borderColor: Colors.transparent),
                onChanged: filterSearchResults,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: items.isEmpty
                  ? const Center(
                      child: Text('No High School Yet'),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });

                            Navigator.pop(context, items[index]);
                          },
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            Icons.location_city_rounded,
                            color: Colors.black,
                          ),
                          title: Text(
                            items[index].name!,
                            overflow: TextOverflow.ellipsis,
                            style: selectedIndex == index
                                ? PSTextStyle.selectedCountryStyle
                                : PSTextStyle.unselectedCountryStyle,
                          ),
                        );
                      }),
            ),
            GestureDetector(
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  isDismissible: false,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  builder: (context) {
                    return WillPopScope(
                      onWillPop: () async => false,
                      child: const AddHighSchoolWidget(),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Add High School Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
