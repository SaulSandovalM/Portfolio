// import 'package:flutter/material.dart';
// import 'package:portafolio/core/constants/colors.dart';
// import 'package:portafolio/providers/conferences_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MainConferences extends StatelessWidget {
//   const MainConferences({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final conferencesProvider = Provider.of<ConferencesProvider>(context);

//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/conference.png',
//             height: 400,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           const SizedBox(height: 40),
//           const Text(
//             'Conferencias',
//             style: TextStyle(
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//               color: CustomColor.textFormColor,
//             ),
//           ),
//           const Text(
//             'Únete a nuestras conferencias para obtener conocimientos valiosos y conectar con profesionales de la industria. Cada sesión está diseñada para ofrecerte información práctica y relevante que puedes aplicar en tu trabajo diario.',
//             style: TextStyle(
//               fontSize: 18,
//               color: CustomColor.textDesc,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 40),
//           _buildConferencesList(context, conferencesProvider)
//         ],
//       ),
//     );
//   }

//   Widget _buildConferencesList(
//       BuildContext context, ConferencesProvider provider) {
//     return FutureBuilder(
//       future: provider.fetchConferences(),
//       builder: (context, snapshot) {
//         if (provider.isLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         final conferences = provider.conferences ?? [];
//         if (conferences.isEmpty) {
//           return const Center(
//             child: Text(
//               'No hay cursos disponibles.',
//               style: TextStyle(color: Colors.white),
//             ),
//           );
//         }

//         return LayoutBuilder(
//           builder: (context, constraints) {
//             final columns = constraints.maxWidth < 880 ? 1 : 2;
//             final itemWidth = (constraints.maxWidth - 20) / columns;
//             return Wrap(
//               spacing: 10,
//               runSpacing: 10,
//               children: List.generate(
//                 conferences.length,
//                 (index) => SizedBox(
//                   width: itemWidth,
//                   child: GestureDetector(
//                     onTap: () async {
//                       final url = Uri.parse(conferences[index]['link']!);
//                       if (await canLaunchUrl(url)) {
//                         await launchUrl(url);
//                       } else {
//                         // ignore: use_build_context_synchronously
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text(
//                               'No se pudo abrir el enlace.',
//                             ),
//                           ),
//                         );
//                       }
//                     },
//                     child: Card(
//                       color: CustomColor.backgroundBase,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ClipRRect(
//                             borderRadius: const BorderRadius.vertical(
//                               top: Radius.circular(10),
//                             ),
//                             child: Image.network(
//                               conferences[index]['image']!,
//                               width: double.infinity,
//                               height: 250,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   conferences[index]['title']!,
//                                   style: const TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.bold,
//                                     color: CustomColor.textFormColor,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Text(
//                                   conferences[index]['date']!,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.grey.shade600,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Text(
//                                   conferences[index]['description']!,
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                     color: CustomColor.textDesc,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 30),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
