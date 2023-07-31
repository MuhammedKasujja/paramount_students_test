import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';

class YearLanguageListWidgetPage extends StatefulWidget {
  final List<String> requiredList;
  final bool isItForYear;
  const YearLanguageListWidgetPage({
    Key? key,
    required this.requiredList,
    required this.isItForYear,
  }) : super(key: key);

  @override
  State<YearLanguageListWidgetPage> createState() =>
      _YearLanguageListWidgetPageState();
}

class _YearLanguageListWidgetPageState
    extends State<YearLanguageListWidgetPage> {
  List<String> items = [];

  int selectedIndex = 0;

  @override
  void initState() {
    setState(() {
      items = widget.requiredList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                Navigator.pop(context, items[0]);
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
              widget.isItForYear == true
                  ? "Select Year"
                  : 'Choose Study Language',
              size: 30,
              weight: FontWeight.w500,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
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
                      title: Text(
                        items[index],
                        overflow: TextOverflow.ellipsis,
                        style: selectedIndex == index
                            ? PSTextStyle.selectedCountryStyle
                            : PSTextStyle.unselectedCountryStyle,
                      ),
                      trailing: selectedIndex == index
                          ? const Icon(
                              Icons.check,
                              color: Colors.amber,
                            )
                          : const SizedBox(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
