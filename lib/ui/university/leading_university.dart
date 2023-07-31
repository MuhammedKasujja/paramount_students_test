// import '../university_profile/university_profile.dart';

// class LeadingUniversityPage extends StatefulWidget {
//   const LeadingUniversityPage({Key? key}) : super(key: key);

//   @override
//   State<LeadingUniversityPage> createState() => _LeadingUniversityPageState();
// }

// class _LeadingUniversityPageState extends State<LeadingUniversityPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: sText("Leading Universities",
//             weight: FontWeight.bold, color: appBlackText),
//         iconTheme: const IconThemeData(color: appBlackText),
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
//         child: Column(
//           children: [
//             Expanded(
//               child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                       maxCrossAxisExtent: appWidth(context),
//                       childAspectRatio: 1.6,
//                       crossAxisSpacing: 0,
//                       mainAxisSpacing: 10),
//                   itemCount: 10,
//                   itemBuilder: (BuildContext ctx, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         goTo(context, const UniversityProfile());
//                       },
//                       child: Card(
//                         color: Colors.white,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Container(
//                           padding: const EdgeInsets.all(10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ClipRRect(
//                                 child: displayLocalImage("university.png",
//                                     radius: 0,
//                                     width: appWidth(context),
//                                     height: 150),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               SizedBox(
//                                 width: appWidth(context) * 0.6,
//                                 child: sText("University of Ghana",
//                                     weight: FontWeight.bold, size: 12),
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     width: appWidth(context) / 2,
//                                     child: sText("Accra, Ghana",
//                                         weight: FontWeight.w500, size: 10),
//                                   ),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   Container(
//                                     child: sText("\$20,000/year",
//                                         weight: FontWeight.w500, size: 10),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
