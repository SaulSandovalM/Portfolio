import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:portafolio/screens/projects/widgets/project_section.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainContainer(
      child: Column(
        children: [
          ProjectSection(),
        ],
      ),
    );
  }
}
