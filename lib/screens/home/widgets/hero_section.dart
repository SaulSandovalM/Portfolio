import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/animated_button.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void downloadCV() {
    const url = 'assets/files/cv.pdf';
    html.AnchorElement(href: url)
      ..setAttribute('download', 'Saul_Sandoval_CV.pdf')
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 770;
    final isMobileMin = MediaQuery.of(context).size.width < 450;

    return FadeTransition(
      opacity: _fadeIn,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 40,
        ),
        child: isMobile
            ? Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Saúl Sandoval Mondragón',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Desarrollador Fullstack & Visionario Digital',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '"Fusionando tecnología y humanidad, una línea de código a la vez."',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 30),
                  isMobileMin
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedButton(
                              text: 'Descargar CV',
                              icon: Icons.download,
                              onTap: downloadCV,
                            ),
                            const SizedBox(height: 20),
                            AnimatedButton(
                              text: 'Contáctame',
                              icon: Icons.mail_outline,
                              onTap: () {
                                // Navegar a /contact
                              },
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedButton(
                              text: 'Descargar CV',
                              icon: Icons.download,
                              onTap: downloadCV,
                            ),
                            const SizedBox(width: 20),
                            AnimatedButton(
                              text: 'Contáctame',
                              icon: Icons.mail_outline,
                              onTap: () {
                                // Navegar a /contact
                              },
                            ),
                          ],
                        )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 50),
                  // Expanded(
                  //   child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Saúl Sandoval Mondragón',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Desarrollador Fullstack & Tech Visionary',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '"El código no solo se escribe, se esculpe para el futuro."',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          AnimatedButton(
                            text: 'Descargar CV',
                            icon: Icons.download,
                            onTap: downloadCV,
                          ),
                          const SizedBox(width: 20),
                          AnimatedButton(
                            text: 'Contáctame',
                            icon: Icons.mail_outline,
                            onTap: () {
                              // Navegar a /contact
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  // ),
                ],
              ),
      ),
    );
  }
}
