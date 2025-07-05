import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:portafolio/screens/home/widgets/hero_section.dart';
import 'package:portafolio/screens/home/widgets/skills_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainContainer(
      child: Column(
        children: [
          HeroSection(),
          SkillsSection(),
        ],
      ),
    );
  }
}
