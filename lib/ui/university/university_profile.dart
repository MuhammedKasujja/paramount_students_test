// import 'package:flutter/material.dart';
// import 'package:paramount_students/app_utils/helper/helper.dart';

// class UniversityPage extends StatefulWidget {
//   const UniversityPage({super.key});

//   @override
//   _UniversityPageState createState() => _UniversityPageState();
// }

// class _UniversityPageState extends State<UniversityPage> {
//   List<ListPrograms> profileState = [
//     ListPrograms(name: "Global Ranking", id: "4,140"),
//     ListPrograms(name: "Number of student", id: "19,165"),
//     ListPrograms(name: "Programs", id: "250+"),
//     ListPrograms(name: "Faculties", id: "70+")
//   ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       child: NestedScrollView(
//           physics: const ClampingScrollPhysics(),
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return <Widget>[
//               SliverAppBar(
//                 elevation: 0,
//                 leading: IconButton(
//                   padding: EdgeInsets.zero,
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Center(
//                       child: Icon(
//                     Icons.arrow_back,
//                     color: appBlackText,
//                   )),
//                 ),
//                 centerTitle: false,
//                 title: SABT(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         child: sText("University of Ghana",
//                             color: appBlackText,
//                             size: 18,
//                             maxLines: 1,
//                             weight: FontWeight.bold),
//                       ),
//                       Container(
//                         child: sText("Accra, Ghana",
//                             color: appBlackText, size: 16, maxLines: 1),
//                       ),
//                     ],
//                   ),
//                 ),
//                 actions: [
//                   IconButton(
//                     padding: EdgeInsets.zero,
//                     onPressed: () {},
//                     icon: const Center(
//                         child: Icon(
//                       Icons.favorite_border,
//                       color: appBlackText,
//                     )),
//                   ),
//                 ],

//                 expandedHeight: 250,

//                 floating: false,
//                 pinned: true,
//                 // snap: true,

//                 backgroundColor: appYellowText,
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Container(
//                     color: Colors.white,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Stack(
//                           children: [
//                             SizedBox(
//                               height: 250,
//                               child: displayImage(
//                                 "",
//                                 radius: 0,
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(3.0),
//                                   margin:
//                                       const EdgeInsets.only(top: 185, left: 20),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       width: 1.0,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   child: displayImage("", radius: 50),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ];
//           },
//           body: Container(
//             padding: const EdgeInsets.only(top: 20, bottom: 20),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ListView(
//                     padding: EdgeInsets.zero,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: sText("University of Ghana",
//                             size: 20, weight: FontWeight.w500),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: sText("Accra, Ghana"),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: sText(
//                             "Üsküdar is a large and densely populated district of Istanbul, Turkey, on the Anatolian shore of the Bosphorus. It is bordered to the north by Beykoz, to the east by Ümraniye, to the southeastl ",
//                             lHeight: 2),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Divider(
//                         color: Colors.black,
//                         thickness: 1,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: sText("Step Into Your Future",
//                             size: 20, weight: FontWeight.w500),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Column(
//                           children: [
//                             Stack(
//                               children: [
//                                 Container(
//                                   margin: leftPadding(60),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         decoration: const BoxDecoration(
//                                             border: Border(
//                                                 bottom: BorderSide(
//                                                     color: Colors.black,
//                                                     width: 1))),
//                                         child: sText("Undergraduate Programs",
//                                             weight: FontWeight.bold, size: 16),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Container(
//                                         child: sText(
//                                             "Deciding to study at Uskudar University will go beyond the classroom to transform your present to the future."),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                   child: Container(
//                                     padding: const EdgeInsets.all(10),
//                                     margin: topPadding(0),
//                                     decoration: const BoxDecoration(
//                                         color: Color(0XFFFFEDB2),
//                                         shape: BoxShape.circle),
//                                     child: displayLocalImage(
//                                         "under_program.png",
//                                         radius: 0),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Column(
//                           children: [
//                             Stack(
//                               children: [
//                                 Container(
//                                   margin: leftPadding(60),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         decoration: const BoxDecoration(
//                                             border: Border(
//                                                 bottom: BorderSide(
//                                                     color: Colors.black,
//                                                     width: 1))),
//                                         child: sText("Graduate Programs",
//                                             weight: FontWeight.bold, size: 16),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Container(
//                                         child: sText(
//                                             "Deciding to study at Uskudar University will go beyond the classroom to transform your present to the future."),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                   child: Container(
//                                     padding: const EdgeInsets.all(10),
//                                     margin: topPadding(0),
//                                     decoration: const BoxDecoration(
//                                         color: Color(0XFFFFEDB2),
//                                         shape: BoxShape.circle),
//                                     child: displayLocalImage("grad_program.png",
//                                         radius: 0),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Column(
//                           children: [
//                             Stack(
//                               children: [
//                                 Container(
//                                   margin: leftPadding(60),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         decoration: const BoxDecoration(
//                                             border: Border(
//                                                 bottom: BorderSide(
//                                                     color: Colors.black,
//                                                     width: 1))),
//                                         child: sText("Online Programs",
//                                             weight: FontWeight.bold, size: 16),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Container(
//                                         child: sText(
//                                             "Deciding to study at Uskudar University will go beyond the classroom to transform your present to the future."),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                   child: Container(
//                                     padding: const EdgeInsets.all(10),
//                                     margin: topPadding(0),
//                                     decoration: const BoxDecoration(
//                                         color: Color(0XFFFFEDB2),
//                                         shape: BoxShape.circle),
//                                     child: displayLocalImage("edu_info.png",
//                                         radius: 0),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Divider(
//                         color: Colors.black,
//                         thickness: 1,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                           height: 100,
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Card(
//                                 color: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Container(
//                                   padding: const EdgeInsets.all(10),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         width: appWidth(context) * 0.37,
//                                         child: sText("${profileState[0].id}",
//                                             weight: FontWeight.bold,
//                                             size: 18,
//                                             align: TextAlign.center),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: appWidth(context) * 0.37,
//                                         child: sText(profileState[0].name,
//                                             weight: FontWeight.w500,
//                                             size: 12,
//                                             align: TextAlign.center),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Card(
//                                 color: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Container(
//                                   padding: const EdgeInsets.all(10),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         width: appWidth(context) * 0.37,
//                                         child: sText("${profileState[0].id}",
//                                             weight: FontWeight.bold,
//                                             size: 18,
//                                             align: TextAlign.center),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: appWidth(context) * 0.37,
//                                         child: sText(profileState[0].name,
//                                             weight: FontWeight.w500,
//                                             size: 12,
//                                             align: TextAlign.center),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                           height: 100,
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Card(
//                                 color: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Container(
//                                   padding: const EdgeInsets.all(10),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         width: appWidth(context) * 0.37,
//                                         child: sText("${profileState[2].id}",
//                                             weight: FontWeight.bold,
//                                             size: 18,
//                                             align: TextAlign.center),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: appWidth(context) * 0.37,
//                                         child: sText(profileState[2].name,
//                                             weight: FontWeight.w500,
//                                             size: 12,
//                                             align: TextAlign.center),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Card(
//                                 color: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Container(
//                                   padding: const EdgeInsets.all(10),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         width: appWidth(context) * 0.37,
//                                         child: sText("${profileState[3].id}",
//                                             weight: FontWeight.bold,
//                                             size: 18,
//                                             align: TextAlign.center),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: appWidth(context) * 0.37,
//                                         child: sText(profileState[3].name,
//                                             weight: FontWeight.w500,
//                                             size: 12,
//                                             align: TextAlign.center),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               child: sText("Why you should study here",
//                                   color: Colors.black,
//                                   weight: FontWeight.w500,
//                                   size: 20),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               child: sText(
//                                   "We have been ranked amongst the world’s top universities and we have done it bby pushing our limits.",
//                                   color: Colors.black,
//                                   weight: FontWeight.w400,
//                                   size: 14,
//                                   lHeight: 2),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             displayLocalImage("why_study.png", radius: 0)
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: sText("What Our Students Say",
//                             weight: FontWeight.w500,
//                             size: 20,
//                             color: Colors.black),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         height: 250,
//                         padding: leftPadding(20),
//                         child: ListView.builder(
//                             itemCount: 10,
//                             scrollDirection: Axis.horizontal,
//                             shrinkWrap: true,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Stack(
//                                         children: [
//                                           Card(
//                                             elevation: 5,
//                                             color: Colors.white,
//                                             margin: topPadding(40),
//                                             child: Container(
//                                               padding: const EdgeInsets.all(20),
//                                               child: Column(
//                                                 children: [
//                                                   SizedBox(
//                                                     width: 250,
//                                                     child: sText(
//                                                         "We have been ranked amongst the world’s top universities and we have done it bby pushing our limits.",
//                                                         size: 14,
//                                                         color: Colors.black,
//                                                         lHeight: 2,
//                                                         align:
//                                                             TextAlign.center),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 20,
//                                                   ),
//                                                   sText("Mazeedah - Nigeria",
//                                                       weight: FontWeight.w500,
//                                                       color: Colors.black),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           Center(
//                                             child: SizedBox(
//                                               width: appWidth(context) * 0.7,
//                                               child: displayImage("imagePath",
//                                                   radius: 30),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         width: 20,
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               );
//                             }),
//                       ),
//                       Card(
//                         elevation: 5,
//                         color: Colors.white,
//                         margin: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Container(
//                           padding: const EdgeInsets.all(20),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 child: sText("FAQs",
//                                     weight: FontWeight.w500,
//                                     color: Colors.black,
//                                     size: 20),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               sText(
//                                   "get answers to all the questions or clarification you need about Uskudar university in turkey.",
//                                   size: 14,
//                                   color: Colors.black,
//                                   lHeight: 2,
//                                   align: TextAlign.start,
//                                   weight: FontWeight.w500)
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: appWidth(context),
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   child: MaterialButton(
//                     elevation: 0,
//                     height: 50,
//                     onPressed: () {},
//                     color: appYellowText,
//                     textColor: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                     child: sText("Apply Now", color: Colors.black),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     ));
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate(this._tabBar);

//   final Container _tabBar;

//   @override
//   double get minExtent => 100;
//   @override
//   double get maxExtent => 900;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//         padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
//         color: Colors.white,
//         child: _tabBar);
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }
// }

// class SABT extends StatefulWidget {
//   final Widget child;
//   const SABT({
//     Key? key,
//     required this.child,
//   }) : super(key: key);
//   @override
//   _SABTState createState() {
//     return _SABTState();
//   }
// }

// class _SABTState extends State<SABT> {
//   ScrollPosition? _position;
//   bool? _visible;
//   @override
//   void dispose() {
//     _removeListener();
//     super.dispose();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _removeListener();
//     _addListener();
//   }

// void _addListener() {
//   _position = Scrollable.of(context).position;
//   _position?.addListener(_positionListener);
//   _positionListener();
// }

//   void _removeListener() {
//     _position?.removeListener(_positionListener);
//   }

//   void _positionListener() {
//     final FlexibleSpaceBarSettings? settings = context
//         .dependOnInheritedWidgetOfExactType(aspect: FlexibleSpaceBarSettings);
//     bool visible =
//         settings == null || settings.currentExtent <= settings.minExtent;
//     if (_visible != visible) {
//       setState(() {
//         _visible = visible;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: _visible!,
//       child: Container(
//         margin: topPadding(0),
//         child: widget.child,
//       ),
//     );
//   }
// }
