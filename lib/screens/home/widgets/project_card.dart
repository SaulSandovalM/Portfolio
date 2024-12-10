import 'package:flutter/material.dart';
import 'package:portafolio/core/utils/project_utils.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 150,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Proyect img
          Image.asset(
            project.image,
            height: 150,
            width: 260,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
