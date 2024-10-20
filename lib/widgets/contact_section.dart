import 'package:flutter/material.dart';
import 'package:portafolio/constants/size.dart';
import 'package:portafolio/constants/sns_links.dart';
import 'package:portafolio/widgets/custom_text_field.dart';
import '../constants/colors.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 25, 60),
      color: CustomColor.bgLightOne,
      child: Column(
        children: [
          // title
          const Text(
            'Get in touch',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= kMinDesktopWidth) {
                return buildnameEmailFieldDesktop();
              }
              // else
              return buildnameEmailFieldMobile();
            }),
          ),
          const SizedBox(height: 15),
          // Message
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: const CustomTextField(
              hintText: 'Tu Mensaje',
              maxLine: 20,
            ),
          ),
          const SizedBox(height: 20),
          // Send Button
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Get in touch'),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: const Divider(),
          ),
          const SizedBox(height: 15),
          // Sns icon button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.github]);
                },
                child: Image.asset('github.png', width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.linkedin]);
                },
                child: Image.asset('linkedin.png', width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.facebook]);
                },
                child: Image.asset('facebook.png', width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.instagram]);
                },
                child: Image.asset('instagram.png', width: 28),
              ),
              // Image.asset('github.png', width: 28),
            ],
          )
        ],
      ),
    );
  }

  Row buildnameEmailFieldDesktop() {
    return const Row(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: 'Tu nombre',
          ),
        ),
        SizedBox(width: 15),
        Flexible(
          child: CustomTextField(
            hintText: 'Tu email',
          ),
        ),
      ],
    );
  }

  Column buildnameEmailFieldMobile() {
    return const Column(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: 'Tu nombre',
          ),
        ),
        SizedBox(height: 15),
        Flexible(
          child: CustomTextField(
            hintText: 'Tu email',
          ),
        ),
      ],
    );
  }
}
