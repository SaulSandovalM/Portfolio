import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/screens/contact/widgets/contact_card.dart';
// import 'package:portafolio/screens/contact/widgets/contact_form.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contacto',
            style: TextStyle(
              color: CustomColor.textPrimary,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 32),
          // ContactForm(),
          ContactCard(),
        ],
      ),
    );
  }
}
