// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// class MoreOffers extends StatefulWidget {
//   final String title;
//   final String leadingImage;
//   final String electricData;
//   final String rupeesButton;
//   final Void
//   const MoreOffers({
//     Key? key,
//     required this.title,
//     required this.electricData,
//     required this.leadingImage,
//     required this.rupeesButton,
//   }) : super(key: key);
//
//   @override
//   State<MoreOffers> createState() => _MoreOffersState();
// }
//
// class _MoreOffersState extends State<MoreOffers> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(
//         left: 20,
//         top: 10,
//         bottom: 10,
//         right: 10,
//       ),
//       padding: const EdgeInsets.only(top: 5, bottom: 5),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(width: 1, color: Colors.greenAccent),
//       ),
//       //We can use Random class also the change the color.
//       child: ListTile(
//         onTap: ,
//         leading: Image.asset('assets/pngs/w.png'),
//         title: const Text('Alto\'s Odysseyz'),
//         subtitle: Row(
//           children: [
//             Container(
//                 margin: const EdgeInsets.only(top: 5),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4),
//                   border: Border.all(width: 1, color: Color(0xff1185D5)),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Get 230',
//                     style: TextStyle(color: Color(0xff1185D5)),
//                   ),
//                 )),
//             const Spacer(),
//             SizedBox(
//               child: Row(
//                 children: [
//                   SvgPicture.asset('assets/svgs/electric.svg'),
//                   const SizedBox(width: 7.16),
//                   const Text(
//                     '23,567',
//                     style: TextStyle(
//                       color: Color(0xffFF9E0C),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 10,
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
