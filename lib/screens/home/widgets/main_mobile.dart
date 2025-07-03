// import 'package:flutter/material.dart';

// import '../../../core/constants/colors.dart';

// class MainMobile extends StatelessWidget {
//   const MainMobile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final screenHeight = screenSize.height;

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
//       height: screenHeight,
//       constraints: const BoxConstraints(minHeight: 560),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ShaderMask(
//             shaderCallback: (bounds) {
//               return LinearGradient(colors: [
//                 CustomColor.scaffoldBg.withOpacity(0.6),
//                 CustomColor.scaffoldBg.withOpacity(0.6)
//               ]).createShader(bounds);
//             },
//             blendMode: BlendMode.srcATop,
//             // avatar img
//             child: Image.asset('assets/profile.jpg'),
//           ),
//           const SizedBox(height: 30),
//           // intro text
//           const Text(
//             'Hey, \nSoy Saul Sandoval\nSoftware Developer',
//             style: TextStyle(
//                 fontSize: 30,
//                 height: 1.5,
//                 fontWeight: FontWeight.bold,
//                 color: CustomColor.whitePrimary),
//           ),
//           const SizedBox(height: 15),
//           SizedBox(
//               width: 190,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: const Text('Get in touch'),
//               ))
//           // btn
//         ],
//       ),
//     );
//   }
// }
