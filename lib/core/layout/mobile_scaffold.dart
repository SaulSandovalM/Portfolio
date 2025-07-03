import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/footer.dart';
import 'package:portafolio/core/widgets/header.dart';

class MobileScaffold extends StatelessWidget {
  final Widget child;

  const MobileScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  child,
                  const SizedBox(height: 32),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
