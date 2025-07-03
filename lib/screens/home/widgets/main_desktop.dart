import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/animated_button.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop>
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
                      width: 150,
                      height: 150,
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
                    'Desarrollador Fullstack & Tech Visionary',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '"El código no solo se escribe, se esculpe para el futuro."',
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
                              onTap: () {
                                // Acción de descarga
                              },
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
                              onTap: () {
                                // Acción de descarga
                              },
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: Column(
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
                              onTap: () {
                                // Acción de descarga
                              },
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
                  ),
                ],
              ),
      ),
    );
  }
}
