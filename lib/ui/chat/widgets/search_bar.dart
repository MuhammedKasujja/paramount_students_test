import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import '../extensions.dart';
import '../enum_constants.dart';
import '../models/items.dart';

class Search extends StatefulWidget {
  final TextEditingController controller;
  final Function setFilter;
  final Function setSearchQuery;
  final int numOfSelectedItems;
  Search({required this.controller, required this.numOfSelectedItems, required this.setFilter, required this.setSearchQuery});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? messagesFilter;
  var previousQuery = '';
  final _focusNode = FocusNode();

  List<Item> Items = [
    Item(content: 'Filter:'),
    ...MessageStatus.values
        .map((msgType) => Item(content: msgType.toNameString()))
        .toList()
  ];

  final GlobalKey _popupMenuKey = GlobalKey();

  void openPopupMenu() {
    final dynamic popupMenuState = _popupMenuKey.currentState;
    popupMenuState?.showButtonMenu();
  }

  void setQuery(String query) {
    widget.setSearchQuery(query);
  }

  @override
  void dispose() {
    // TODO: mplement dispose
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: TextField(
        controller: widget.controller,
        style: const TextStyle(
          color: appBlackText,
        ),
        enabled: widget.numOfSelectedItems > 0 ? false : true,
        onTapOutside: (_) => _focusNode.unfocus(),
        focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: widget.numOfSelectedItems > 0 ? '' : 'Search',
          filled: true,
          fillColor: psGrey6,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          prefixIcon: widget.numOfSelectedItems > 0
              ? null
              : const Icon(
                  Icons.search,
                  color: psGrey3,
                ),
          suffixIcon: widget.numOfSelectedItems > 0
              ? Container(
                  padding: const EdgeInsets.only(right: 20, top: 8, bottom: 8),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    GestureDetector(
                        child: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                        onTap: () {}),
                    const Spacing.meduimWidth(),
                    GestureDetector(
                        child: const Icon(
                          Icons.archive,
                          color: Colors.grey,
                        ),
                        onTap: () {})
                  ]),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                          child: VerticalDivider(
                            thickness: 1,
                            color: psGrey4,
                          ),
                        ),
                        GestureDetector(
                            onTap: openPopupMenu,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                PopupMenuButton<String>(
                                  key: _popupMenuKey,
                                  icon: const Icon(
                                    Icons.filter_alt,
                                    color: Colors.grey,
                                  ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                onSelected: (newValue) {
                                  setState(() {
                                    switch (newValue) {
                                      case 'All Messages':
                                        widget.setFilter(newValue);
                                        messagesFilter = newValue;
                                        // people = api.searchPeople(
                                        //   responsibility: responsibilityFilter,
                                        //   query: previousQuery,
                                        // );
                                        break;
                                      case 'Favourite Messages':
                                        widget.setFilter(newValue);
                                        messagesFilter = newValue;
                                        break;
                                      case 'Unread Messages':
                                        widget.setFilter(newValue);
                                        messagesFilter = newValue;
                                        break;
                                      case 'Read Messages':
                                        widget.setFilter(newValue);
                                        messagesFilter = newValue;
                                        break;
                                      default:
                                        widget.setFilter(null);
                                        messagesFilter = null;
                                        break;
                                    }
                                  });
                                },
                                itemBuilder: (_) => Items.map(
                                  (item) => PopupMenuItem(
                                    value: item.content,
                                    child: item != Items.last
                                    ? Column(
                                        children: [
                                          const Spacing.smallHeight(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              sText(item.content, color: psBlack1, size: item.content == 'Filter:' ? 17 : 14),
                                              if (messagesFilter == item.content)
                                                const Icon(
                                                  Icons.check,
                                                  color: appBlackText,
                                                  size: 23,
                                                )
                                            ],
                                          ),
                                          const Spacing.smallHeight(),
                                          if (item.content == 'Filter:')
                                          const Divider(thickness: 2, color: psBlack1),
                                          if (item.content == 'Filter:')
                                          // const Spacing.extraSmallHeight(),
                                          const Spacing.tinyHeight(),
                                          if (item.content != 'Filter:')
                                          const Divider(thickness: 1, color: psGrey5),
                                        ]
                                    )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          sText(item.content, color: psBlack1, size: item.content == 'Filter:' ? 17 : 14),
                                          if (messagesFilter == item.content)
                                            const Icon(
                                              Icons.check,
                                              color: appBlackText,
                                              size: 23,
                                            )
                                        ],
                                      ),
                                  ),
                                ).toList(),
                              ),
                              sText('Filter', color: Colors.grey)
                            ],
                          )

                        ),
                        
                      ],
                    ),
                  ),
                ),
        ),
        onChanged: (query) => setQuery(query),
      ),
    );
  }
}
