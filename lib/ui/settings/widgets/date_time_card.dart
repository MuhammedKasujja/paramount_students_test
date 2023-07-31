import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'switch_toggle.dart';

class DateTimeCard extends StatefulWidget {
  const DateTimeCard({super.key});

  @override
  State<DateTimeCard> createState() => _DateTimeCardState();
}

class _DateTimeCardState extends State<DateTimeCard> {
  bool isChangeDate = false;
  tz.Location? selectedLocation;
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      initialExpanded: true,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: <Widget>[
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: false,
                ),
                header: Padding(
                  padding: const EdgeInsets.all(10),
                  child: sText(
                    PSStrings.psDateTime,
                    weight: FontWeight.w600,
                    size: 16,
                  ),
                ),
                collapsed: const SizedBox.shrink(),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    currentSystemDate(),
                    Divider(
                      color: Colors.grey[900],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sText(
                                'Set the Time Zone Automatically',
                                size: 14,
                                lHeight: 1.5,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              sText2(
                                'Sync all your application deadlines to your region automatically.',
                                weight: FontWeight.w400,
                                color: const Color(0xFF191C1C).withOpacity(0.7),
                                size: 12,
                                lHeight: 1.5,
                              )
                            ],
                          ),
                        ),
                        SwitchToggle(
                          isActive: isChangeDate,
                          onToggle: (val) {
                            setState(() {
                              isChangeDate = val;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    sText(
                      'Time Zone',
                      size: 14,
                      lHeight: 1.5,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    timezonePlaceholder()
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(
                        crossFadePoint: 0,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget timezonePlaceholder() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isChangeDate ? const Color(0xFFE6E6E6) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: !isChangeDate ? Colors.black : Colors.transparent,
          )),
      child: sText(
        '(UTC +03:00) Istanbul',
        size: 12,
        color: isChangeDate
            ? const Color(0xFF191C1C).withOpacity(0.7)
            : Colors.black,
      ),
    );
  }

  Widget currentSystemDate() {
    getTimezones();
    final now = DateTime.now();
    final formatedDate = DateFormat('h:mm a, EEEE, MMMM dd, yyyy').format(now);
    return Text(formatedDate);
  }

  Widget timezoneSelector() {
    final locations = getTimezones();
    return DropdownButton<tz.Location>(
      // Initial Value
      value: selectedLocation,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: locations.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(DateTime.now()
              .timeZoneName), //Text('(${item.currentTimeZone.abbreviation} ${item.currentTimeZone.isDst})'),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (newValue) {
        setState(() {
          selectedLocation = newValue;
        });
      },
    );
  }

  List<tz.Location> getTimezones() {
    tz.initializeTimeZones();
    var locations = tz.timeZoneDatabase.locations;
    return locations.values.toList();
  }
}
