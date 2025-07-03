import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/footer.dart';
import 'package:portafolio/core/widgets/header.dart';

class DesktopScaffold extends StatelessWidget {
  final Widget child;

  const DesktopScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical: 48,
                    ),
                    child: child,
                  ),
                  const SizedBox(height: 64),
                  Container(
                    width: double.infinity,
                    color: Colors.black,
                    child: const Footer(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
