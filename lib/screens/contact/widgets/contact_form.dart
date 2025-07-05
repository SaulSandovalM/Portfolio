import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _messageCtrl = TextEditingController();

  bool _sending = false;

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _sending = true);

    try {
      await FirebaseFirestore.instance.collection('messages').add({
        'name': _nameCtrl.text.trim(),
        'email': _emailCtrl.text.trim(),
        'message': _messageCtrl.text.trim(),
        'createdAt': Timestamp.now(),
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mensaje enviado con éxito'),
          backgroundColor: Colors.green,
        ),
      );

      _nameCtrl.clear();
      _emailCtrl.clear();
      _messageCtrl.clear();
    } catch (e) {
      debugPrint('Error al enviar mensaje: $e');

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Hubo un error al enviar tu mensaje'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 700;
          return Column(
            children: [
              Row(
                children: [
                  if (isWide)
                    Expanded(
                      child: _buildTextField(
                        controller: _nameCtrl,
                        label: 'Nombre',
                        icon: Icons.person_outline,
                      ),
                    ),
                  if (isWide) const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      controller: _emailCtrl,
                      label: 'Correo',
                      icon: Icons.email_outlined,
                      validator: (val) {
                        if (val == null || !val.contains('@')) {
                          return 'Correo inválido';
                        }
                        return null;
                      },
                    ),
                  ),
                  if (!isWide) const SizedBox(height: 16),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _messageCtrl,
                label: 'Mensaje',
                icon: Icons.chat_outlined,
                maxLines: 6,
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: _sending ? null : _submitForm,
                  icon: _sending
                      ? const CircularProgressIndicator(strokeWidth: 2)
                      : const Icon(Icons.send),
                  label: const Text('Enviar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.accent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      style: const TextStyle(color: CustomColor.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: CustomColor.accent),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.border),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.accent, width: 1.5),
        ),
        labelStyle: TextStyle(color: CustomColor.textSecondary),
        filled: true,
        fillColor: CustomColor.backgroundCard,
      ),
    );
  }
}
