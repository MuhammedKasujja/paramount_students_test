///TODO: Remove this 360 view from here
///
// Container(
//   width: 250,
//   height: 36,
//   padding:
//       const EdgeInsets.symmetric(horizontal: AppDimension.large),
//   child: AppElevatedButton(
//     label: 'Virtual tour',
//     buttonColor: psColorPrimary1000,
//     isLoading: false,
//     borderColor: psColorPrimary1000,

//     ///TODO: REMOVE THIS FUNCTION FROM HERE

//     onPressed: () async {
//       debugPrint('Attemping to go to virtual tour');
//       final webParse =
//           Uri.parse('https://paramountstudents.network/vtour');
//       if (await canLaunchUrl(webParse)) {
//         if (!await launchUrl(
//           webParse,
//           mode: LaunchMode.inAppWebView,
//         )) {
//           toastMessage(
//             'Please Try Again',
//             long: true,
//           );
//         }
//       } else {
//         toastMessage(
//           'Server Down!!! Please Try Again Later',
//           long: true,
//         );
//       }
//     },
//   ),
// ),
