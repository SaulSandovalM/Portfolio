import 'package:flutter/material.dart';
import 'package:portafolio/screens/projects/widgets/main_projects.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MainProjects(),
    );
  }
}
