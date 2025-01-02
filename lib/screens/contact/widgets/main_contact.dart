import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/widgets/container.dart';

class MainContact extends StatefulWidget {
  const MainContact({super.key});

  @override
  MainContactState createState() => MainContactState();
}

class MainContactState extends State<MainContact> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('contacts').add({
          'name': _nameController.text,
          'email': _emailController.text,
          'message': _messageController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Mensaje enviado')),
          );
          _formKey.currentState!.reset();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error al enviar el mensaje')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Envíame un mensaje y me pondré en contacto contigo lo antes posible.',
                          style: TextStyle(
                            color: CustomColor.navText,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _nameController,
                          style: const TextStyle(color: CustomColor.navText),
                          decoration: const InputDecoration(
                            labelText: 'Nombre',
                            labelStyle: TextStyle(color: CustomColor.navText),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColor.navBorder),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomColor.textFormColor,
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su nombre';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          style: const TextStyle(color: CustomColor.navText),
                          decoration: const InputDecoration(
                            labelText: 'Correo Electrónico',
                            labelStyle: TextStyle(color: CustomColor.navText),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColor.navBorder),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomColor.textFormColor,
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su correo electrónico';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _messageController,
                          style: const TextStyle(color: CustomColor.navText),
                          decoration: const InputDecoration(
                            labelText: 'Mensaje',
                            labelStyle: TextStyle(color: CustomColor.navText),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColor.navBorder),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomColor.textFormColor,
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su mensaje';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColor.primaryBtn,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: _submitForm,
                            child: const Text(
                              'Enviar',
                              style: TextStyle(
                                fontSize: 16,
                                color: CustomColor.whitePrimary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
