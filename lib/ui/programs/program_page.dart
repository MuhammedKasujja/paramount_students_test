import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';

class ProgramPage extends StatefulWidget {
  const ProgramPage({super.key});

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  List<ListPrograms> profileState = [
    ListPrograms(name: "Global Ranking", id: "4,140"),
    ListPrograms(name: "Number of student", id: "19,165"),
    ListPrograms(name: "Programs", id: "250+"),
    ListPrograms(name: "Faculties", id: "70+")
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            physics: const ClampingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  leading: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Center(
                        child: Icon(
                      Icons.arrow_back,
                      color: appBlackText,
                    )),
                  ),
                  centerTitle: false,
                  title: SABT(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: sText("University of Ghana",
                              color: appBlackText,
                              size: 18,
                              maxLines: 1,
                              weight: FontWeight.bold),
                        ),
                        Container(
                          child: sText("Accra, Ghana",
                              color: appBlackText, size: 16, maxLines: 1),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Center(
                          child: Icon(
                        Icons.favorite_border,
                        color: appBlackText,
                      )),
                    ),
                  ],

                  expandedHeight: 230,

                  floating: false,
                  pinned: true,
                  // snap: true,

                  backgroundColor: appYellowText,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 250,
                                child: displayImage(
                                  "",
                                  radius: 0,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(3.0),
                                margin:
                                    const EdgeInsets.only(top: 175, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    sText("Computer Science",
                                        size: 20,
                                        weight: FontWeight.bold,
                                        color: Colors.black),
                                    sText("University of Ghana",
                                        size: 20,
                                        weight: FontWeight.w500,
                                        color: Colors.black),
                                    sText("Accra,Ghana",
                                        weight: FontWeight.normal,
                                        color: Colors.black),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              padding: const EdgeInsets.only(top: 0, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20, right: 0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: appYellowText, width: 2))),
                              child: sText("Course Overview",
                                  size: 20, weight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: sText(
                              "the southeast by Ataşehir and to the south by Kadıköy; with Karaköy, Kabataş, Beşiktaş, and the historic city center of Fatih facing it on the opposite shore. Üsküdar has been a conservative cultural center of the Anatolian side of Istanbul",
                              lHeight: 2,
                              maxLines: 100),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20, right: 0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: appYellowText, width: 2))),
                              child: sText("Start Data",
                                  size: 20, weight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: leftPadding(60),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: sText(
                                              "Semester 1 ( Septeber, 2022)",
                                              weight: FontWeight.bold,
                                              size: 16),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            sText("Duration:",
                                                color: Colors.black,
                                                weight: FontWeight.w500),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            sText("3 years",
                                                color: Colors.black,
                                                weight: FontWeight.w400),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            sText("Campus:",
                                                color: Colors.black,
                                                weight: FontWeight.w500),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            sText("Accra",
                                                color: Colors.black,
                                                weight: FontWeight.w400),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: topPadding(0),
                                      decoration: const BoxDecoration(
                                          color: Color(0XFFFFEDB2),
                                          shape: BoxShape.circle),
                                      child: displayLocalImage(
                                          "under_program.png",
                                          radius: 0),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: leftPadding(70),
                              color: Colors.black,
                              width: 2,
                              height: 50,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          margin: const EdgeInsets.only(left: 30),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: leftPadding(60),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: sText(
                                              "Semester 1 ( January 2023)",
                                              weight: FontWeight.bold,
                                              size: 16),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            sText("Duration:",
                                                color: Colors.black,
                                                weight: FontWeight.w500),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            sText("3 years",
                                                color: Colors.black,
                                                weight: FontWeight.w400),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            sText("Campus:",
                                                color: Colors.black,
                                                weight: FontWeight.w500),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            sText("Accra",
                                                color: Colors.black,
                                                weight: FontWeight.w400),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: topPadding(0),
                                      decoration: const BoxDecoration(
                                          color: Color(0XFFFFEDB2),
                                          shape: BoxShape.circle),
                                      child: displayLocalImage(
                                          "under_program.png",
                                          radius: 0),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20, right: 0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: appYellowText, width: 2))),
                              child: sText("Cost",
                                  size: 20, weight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: sText("Total Cost for 3 Years",
                              lHeight: 2, maxLines: 100),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          // width: 380,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              boxShadow: appShadow(Colors.grey[100]!, 4, 4, 4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                height: 50,
                                onPressed: () {},
                                color: Colors.white,
                                textColor: Colors.black,
                                elevation: 0,
                                child: sText("USD 20,000",
                                    weight: FontWeight.bold,
                                    size: 20,
                                    color: Colors.black),
                              ),
                              MaterialButton(
                                height: 50,
                                onPressed: () {},
                                elevation: 0,
                                color: appYellowText,
                                textColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    sText("US Dollars", color: Colors.black),
                                    const Icon(Icons.arrow_drop_down)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20, right: 0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: appYellowText, width: 2))),
                              child: sText("Requirments",
                                  size: 20,
                                  weight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: sText("I Am Currently An",
                              lHeight: 2,
                              maxLines: 100,
                              weight: FontWeight.w500,
                              size: 20,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: appYellowText,
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              sText("High school student or graduate")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: appYellowText)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              sText("University Transfer student")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: appYellowText)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              sText("International Student")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: sText("My Education Systsem Is:",
                              lHeight: 2,
                              maxLines: 100,
                              weight: FontWeight.w500,
                              size: 20,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          // width: 380,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              boxShadow: appShadow(Colors.grey[100]!, 4, 4, 4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                height: 50,
                                onPressed: () {},
                                color: Colors.white,
                                textColor: Colors.black,
                                elevation: 0,
                                child: sText("Turkey Curriculum",
                                    weight: FontWeight.w500,
                                    size: 16,
                                    color: Colors.black),
                              ),
                              MaterialButton(
                                padding: EdgeInsets.zero,
                                height: 50,
                                onPressed: () {},
                                elevation: 0,
                                color: appYellowText,
                                textColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(Icons.arrow_drop_down),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: sText("Required Subjects for Admission",
                              lHeight: 2,
                              maxLines: 100,
                              weight: FontWeight.w500,
                              size: 20,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: appYellowText,
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              sText("Mathematica A+",
                                  size: 12, weight: FontWeight.w500)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: appYellowText,
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              sText("English A+",
                                  size: 12, weight: FontWeight.w500)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: appYellowText,
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              sText("IELTS 900",
                                  size: 12, weight: FontWeight.w500)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: appYellowText,
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              sText("A-Levels 5As",
                                  size: 12, weight: FontWeight.w500)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20, right: 0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: appYellowText, width: 2))),
                              child: sText("Course Outline",
                                  size: 20,
                                  weight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        for (int i = 0; i < 5; i++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: sText("Introduction to Computer Science",
                                    size: 14, weight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20, right: 0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: appYellowText, width: 2))),
                              child: sText("Career Opportunities",
                                  size: 20,
                                  weight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        for (int i = 0; i < 5; i++)
                          Card(
                            elevation: 5,
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: sText("Software Engineer",
                                        weight: FontWeight.w500,
                                        color: Colors.black,
                                        size: 20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  sText(
                                      "get answers to all the questions or clarification you need about Uskudar university in turkey.",
                                      size: 14,
                                      color: Colors.black,
                                      lHeight: 2,
                                      align: TextAlign.start,
                                      weight: FontWeight.w400)
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    width: appWidth(context),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      elevation: 0,
                      height: 50,
                      onPressed: () {},
                      color: appYellowText,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: sText("Apply Now", color: Colors.black),
                    ),
                  ),
                ],
              ),
            )));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Container _tabBar;

  @override
  double get minExtent => 100;
  @override
  double get maxExtent => 900;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        color: Colors.white,
        child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class SABT extends StatefulWidget {
  final Widget child;
  const SABT({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  State<SABT> createState() {
    return _SABTState();
  }
}

class _SABTState extends State<SABT> {
  ScrollPosition? _position;
  bool? _visible;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context).position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings = context
        .dependOnInheritedWidgetOfExactType(aspect: FlexibleSpaceBarSettings);
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible!,
      child: Container(
        margin: topPadding(0),
        child: widget.child,
      ),
    );
  }
}
