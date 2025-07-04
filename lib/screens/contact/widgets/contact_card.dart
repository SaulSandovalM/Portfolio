import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portafolio/core/constants/colors.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onHover: (_) {},
        child: Container(
          padding: const EdgeInsets.all(32),
          constraints: const BoxConstraints(maxWidth: 600),
          decoration: BoxDecoration(
            color: CustomColor.backgroundCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: CustomColor.border.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: CustomColor.accent.withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Saúl Sandoval Mondragón',
                style: TextStyle(
                  color: CustomColor.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Desarrollador Fullstack & Tech Visionary',
                style: TextStyle(
                  color: CustomColor.textSecondary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),

              // Botones
              _ContactButton(
                icon: Icons.email_outlined,
                label: 'Email',
                onTap: () => _launchUrl('mailto:sauldevelop@gmail.com'),
              ),
              _ContactButton(
                icon: FontAwesomeIcons.whatsapp,
                label: 'WhatsApp',
                onTap: () => _launchUrl('https://wa.me/5217711895701'),
              ),
              _ContactButton(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                onTap: () => _launchUrl('https://github.com/SaulSandovalM'),
              ),
              _ContactButton(
                icon: FontAwesomeIcons.youtube,
                label: 'YouTube',
                onTap: () =>
                    _launchUrl('https://www.youtube.com/@SaulSandovalM'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: CustomColor.buttonBackground,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _hover
                  ? CustomColor.accent
                  : CustomColor.border.withOpacity(0.3),
            ),
            boxShadow: _hover
                ? [
                    BoxShadow(
                      color: CustomColor.accent.withOpacity(0.4),
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 0),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: CustomColor.accent, size: 20),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: const TextStyle(
                  color: CustomColor.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
