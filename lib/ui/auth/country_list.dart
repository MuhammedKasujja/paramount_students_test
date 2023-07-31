import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paramount_students/app_utils/countries/countries.dart';
import 'package:paramount_students/app_utils/countries/country_model.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';

class CountryList extends StatefulWidget {
  final Country? currentCountry;
  final bool isItForMobileNumber;
  final Country? previousSelectedCountry;
  const CountryList(
      {Key? key,
      this.currentCountry,
      required this.isItForMobileNumber,
      this.previousSelectedCountry})
      : super(key: key);

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  late Country currentCountry;
  late List<Country> countryList;
  var items = [];

  @override
  void initState() {
    currentCountry = widget.currentCountry ?? Countries.countryList.first;
    countryList = Countries.countryList;
    items.addAll(countryList);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Country> searchList = [];
    searchList.addAll(countryList);
    if (query.isNotEmpty) {
      List<Country> listData = [];
      for (var item in searchList) {
        if (item.contains(query.capitalizeFirst!)) {
          listData.add(item);
        }
      }
      setState(() {
        items.clear();
        items.addAll(listData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(countryList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
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
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context,
                        widget.previousSelectedCountry ?? Countries.psTR);
                  },
                  child: Row(
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
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            sText(
                widget.isItForMobileNumber == true
                    ? "Select Area Code"
                    : 'Country',
                size: isLandscape ? 20 : 30,
                weight: FontWeight.w500,
                color: Colors.black),
            Divider(
              color: Colors.grey[200],
              thickness: 2,
            ),
            SizedBox(
              height: isLandscape ? null : 20,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                foregroundImage: AssetImage(
                  currentCountry.flagPath!,
                ),
                radius: 10,
              ),
              title: Text(
                currentCountry.name,
                overflow: TextOverflow.ellipsis,
                style: PSTextStyle.selectedCountryStyle,
              ),
              trailing: widget.isItForMobileNumber == true
                  ? sText(
                      currentCountry.dialCode,
                      color: psPrimaryColor,
                      weight: FontWeight.normal,
                    )
                  : const SizedBox(),
            ),
            SizedBox(
              height: isLandscape ? 10 : 50,
            ),
            sText(
                widget.isItForMobileNumber == true
                    ? "Country/Region"
                    : 'Location',
                color: Colors.black,
                weight: FontWeight.w500),
            const SizedBox(
              height: 10,
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
                      // Return the Tapped Country
                      Navigator.pop(context, items[index]);
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      foregroundImage: AssetImage(
                        items[index].flagPath,
                      ),
                      radius: 10,
                    ),
                    title: Text(
                      items[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: currentCountry == items[index]
                          ? PSTextStyle.selectedCountryStyle
                          : PSTextStyle.unselectedCountryStyle,
                    ),
                    trailing: widget.isItForMobileNumber == true
                        ? Text(
                            items[index].dialCode,
                            overflow: TextOverflow.ellipsis,
                            style: currentCountry == items[index]
                                ? PSTextStyle.selectedCountryStyle
                                : PSTextStyle.unselectedCountryStyle,
                          )
                        : const SizedBox(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
