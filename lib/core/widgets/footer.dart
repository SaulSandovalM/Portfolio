import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portafolio/core/constants/nav_items.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      decoration: const BoxDecoration(
        color: CustomColor.backgroundBase,
        border: Border(
          top: BorderSide(
            color: CustomColor.accent, // línea estilo neón
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildFooterSections(context, isMobile),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildFooterSections(context, isMobile),
                ),
          const SizedBox(height: 8),
          const Divider(color: Colors.grey, thickness: 0.2),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              '© 2024 Saúl Sandoval. Todos los derechos reservados.',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFooterSections(BuildContext context, bool isMobile) {
    return [
      // Contacto
      Padding(
        padding: EdgeInsets.only(bottom: isMobile ? 24 : 0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contacto',
              style: TextStyle(
                color: CustomColor.textPrimary,
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
              'Teléfono: +52 771 350 7545',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),

      // Enlaces
      Padding(
        padding: EdgeInsets.only(bottom: isMobile ? 24 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enlaces',
              style: TextStyle(
                color: CustomColor.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            _footerLink(context, 'Proyectos', '/projects'),
            _footerLink(context, 'Cursos', '/courses'),
          ],
        ),
      ),

      // Redes
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sígueme',
            style: TextStyle(
              color: CustomColor.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              for (int i = 0; i < footerIcons.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: Icon(
                      footerIcons[i],
                      color: Colors.grey,
                    ),
                    splashRadius: 20,
                    onPressed: () async {
                      final url = socialMediaUrls[i];
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      }
                    },
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    tooltip: socialMediaUrls[i],
                  ),
                ),
            ],
          ),
        ],
      ),
    ];
  }

  Widget _footerLink(BuildContext context, String label, String route) {
    return TextButton(
      onPressed: () => context.go(route),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),
    );
  }
}
