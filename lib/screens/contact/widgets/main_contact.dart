// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:portafolio/core/constants/colors.dart';

// class MainContact extends StatefulWidget {
//   const MainContact({super.key});

//   @override
//   MainContactState createState() => MainContactState();
// }

// class MainContactState extends State<MainContact> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _messageController = TextEditingController();
//   bool _isSubmitting = false;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _messageController.dispose();
//     super.dispose();
//   }

//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate() && !_isSubmitting) {
//       setState(() {
//         _isSubmitting = true;
//       });
//       try {
//         await FirebaseFirestore.instance.collection('contacto').add({
//           'name': _nameController.text.trim(),
//           'email': _emailController.text.trim(),
//           'message': _messageController.text.trim(),
//           'timestamp': FieldValue.serverTimestamp(),
//         });

//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Mensaje enviado con éxito.')),
//           );
//           _formKey.currentState!.reset();
//           _nameController.clear();
//           _emailController.clear();
//           _messageController.clear();
//         }
//       } catch (e) {
//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Error al enviar el mensaje.')),
//           );
//         }
//       } finally {
//         if (mounted) {
//           setState(() {
//             _isSubmitting = false;
//           });
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isWideScreen = constraints.maxWidth > 800;

//         return SizedBox(
//           height: MediaQuery.of(context).size.height - 60,
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(0.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   isWideScreen
//                       ? Row(
//                           children: [
//                             Flexible(
//                               child: _buildForm(),
//                             ),
//                             Flexible(
//                               child: _buildImage(),
//                             ),
//                           ],
//                         )
//                       : _buildForm(),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           const Text(
//             'Envíame un mensaje y me pondré en contacto contigo lo antes posible.',
//             style: TextStyle(
//               color: CustomColor.navText,
//               fontSize: 20,
//             ),
//             textAlign: TextAlign.start,
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: _nameController,
//             style: const TextStyle(color: CustomColor.navText),
//             decoration: const InputDecoration(
//               labelText: 'Nombre',
//               labelStyle: TextStyle(color: CustomColor.navText),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: CustomColor.navBorder),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide:
//                     BorderSide(color: CustomColor.textFormColor, width: 2),
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Por favor ingrese su nombre.';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: _emailController,
//             style: const TextStyle(color: CustomColor.navText),
//             decoration: const InputDecoration(
//               labelText: 'Correo Electrónico',
//               labelStyle: TextStyle(color: CustomColor.navText),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: CustomColor.navBorder),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide:
//                     BorderSide(color: CustomColor.textFormColor, width: 2),
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Por favor ingrese su correo electrónico.';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: _messageController,
//             style: const TextStyle(color: CustomColor.navText),
//             decoration: const InputDecoration(
//               labelText: 'Mensaje',
//               labelStyle: TextStyle(color: CustomColor.navText),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: CustomColor.navBorder),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide:
//                     BorderSide(color: CustomColor.textFormColor, width: 2),
//               ),
//             ),
//             maxLines: 5,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Por favor ingrese su mensaje.';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: CustomColor.primaryBtn,
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//               ),
//               onPressed: _isSubmitting ? null : _submitForm,
//               child: _isSubmitting
//                   ? const CircularProgressIndicator(
//                       color: CustomColor.whitePrimary)
//                   : const Text('Enviar',
//                       style: TextStyle(color: CustomColor.whitePrimary)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildImage() {
//     return Image.asset(
//       'assets/images/contact_test.png',
//       fit: BoxFit.cover,
//       errorBuilder: (context, error, stackTrace) {
//         return const Text(
//           'No se pudo cargar la imagen.',
//           style: TextStyle(color: CustomColor.navText),
//         );
//       },
//     );
//   }
// }
