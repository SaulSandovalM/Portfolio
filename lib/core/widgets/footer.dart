import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portafolio/core/constants/nav_items.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.backgroundBase,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contacto',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: sauldevelop@gmail.com',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Teléfono: +52 771 189 5701',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enlaces',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => context.go('/projects'),
                    child: const Text(
                      'Proyectos',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.go('/courses'),
                    child: const Text(
                      'Cursos',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              // Columna 3: Redes sociales
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sígueme',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      for (int i = 0; i < footerIcons.length; i++)
                        IconButton(
                          icon: Icon(
                            footerIcons[i],
                            color: Colors.grey,
                          ),
                          onPressed: () async {
                            final url = socialMediaUrls[i];
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            }
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Divider(color: Colors.grey, height: 32),
          // Derechos reservados
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Text(
              '© 2024 Saúl Sandoval. Todos los derechos reservados.',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
