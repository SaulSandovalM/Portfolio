// import 'package:flutter/material.dart';
// import 'package:portafolio/core/constants/size.dart';
// import 'package:portafolio/core/constants/sns_links.dart';
// import 'package:portafolio/screens/home/widgets/custom_text_field.dart';
// import '../../../core/constants/colors.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ContactSection extends StatelessWidget {
//   const ContactSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(24, 20, 25, 60),
//       color: CustomColor.bgLightOne,
//       child: Column(
//         children: [
//           // title
//           const Text(
//             'Get in touch',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 24,
//               color: CustomColor.whitePrimary,
//             ),
//           ),
//           const SizedBox(height: 50),
//           ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 700, maxHeight: 100),
//             child: LayoutBuilder(builder: (context, constraints) {
//               if (constraints.maxWidth >= kMinDesktopWidth) {
//                 return buildnameEmailFieldDesktop();
//               }
//               // else
//               return buildnameEmailFieldMobile();
//             }),
//           ),
//           const SizedBox(height: 15),
//           // Message
//           ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 700),
//             child: const CustomTextField(
//               hintText: 'Tu Mensaje',
//               maxLine: 20,
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Send Button
//           ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 700),
//             child: SizedBox(
//               width: double.maxFinite,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: const Text('Get in touch'),
//               ),
//             ),
//           ),
//           const SizedBox(height: 30),
//           ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 700),
//             child: const Divider(),
//           ),
//           const SizedBox(height: 15),
//           // Sns icon button links
//           Wrap(
//             spacing: 12,
//             runSpacing: 12,
//             alignment: WrapAlignment.center,
//             children: [
//               InkWell(
//                 onTap: () async {
//                   final Uri url = Uri.parse(SnsLinks.github);
//                   if (await canLaunchUrl(url)) {
//                     await launchUrl(url, mode: LaunchMode.externalApplication);
//                   } else {
//                     throw 'Could not launch $url';
//                   }
//                 },
//                 child: Image.asset('github.png', width: 28),
//               ),
//               InkWell(
//                 onTap: () async {
//                   final Uri url = Uri.parse(SnsLinks.linkedin);
//                   if (await canLaunchUrl(url)) {
//                     await launchUrl(url, mode: LaunchMode.externalApplication);
//                   } else {
//                     throw 'Could not launch $url';
//                   }
//                 },
//                 child: Image.asset('linkedin.png', width: 28),
//               ),
//               InkWell(
//                 onTap: () async {
//                   final Uri url = Uri.parse(SnsLinks.facebook);
//                   if (await canLaunchUrl(url)) {
//                     await launchUrl(url, mode: LaunchMode.externalApplication);
//                   } else {
//                     throw 'Could not launch $url';
//                   }
//                 },
//                 child: Image.asset('facebook.png', width: 28),
//               ),
//               InkWell(
//                 onTap: () async {
//                   final Uri url = Uri.parse(SnsLinks.instagram);
//                   if (await canLaunchUrl(url)) {
//                     await launchUrl(url, mode: LaunchMode.externalApplication);
//                   } else {
//                     throw 'Could not launch $url';
//                   }
//                 },
//                 child: Image.asset('instagram.png', width: 28),
//               ),
//               // Image.asset('github.png', width: 28),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Row buildnameEmailFieldDesktop() {
//     return const Row(
//       children: [
//         Flexible(
//           child: CustomTextField(
//             hintText: 'Tu nombre',
//           ),
//         ),
//         SizedBox(width: 15),
//         Flexible(
//           child: CustomTextField(
//             hintText: 'Tu email',
//           ),
//         ),
//       ],
//     );
//   }

//   Column buildnameEmailFieldMobile() {
//     return const Column(
//       children: [
//         Flexible(
//           child: CustomTextField(
//             hintText: 'Tu nombre',
//           ),
//         ),
//         SizedBox(height: 15),
//         Flexible(
//           child: CustomTextField(
//             hintText: 'Tu email',
//           ),
//         ),
//       ],
//     );
//   }
// }
