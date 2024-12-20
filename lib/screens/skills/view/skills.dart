import 'package:flutter/material.dart';
import 'package:portafolio/screens/skills/widgets/main_skills.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MainSkills(),
    );
  }
}
