import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/screens/projects/widgets/project_card.dart';

class MainProjects extends StatelessWidget {
  const MainProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = _mockProjects; // Aquí irían sus proyectos reales

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título animado
          const Text(
            'Proyectos',
            style: TextStyle(
              color: CustomColor.textPrimary,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Galería responsiva
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 1000
                  ? 3
                  : constraints.maxWidth > 700
                      ? 2
                      : 1;

              return GridView.builder(
                shrinkWrap: true,
                itemCount: projects.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) {
                  return ProjectCard(project: projects[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// Simulador temporal de datos
final List<Project> _mockProjects = [
  Project(
    title: 'Sistema de Reservas',
    description: 'App web para gestionar reservas de espacios y citas.',
    tech: ['Flutter', 'Firebase'],
    repoUrl: 'https://github.com/saul/sistema-reservas',
  ),
  Project(
    title: 'Landing Page VR',
    description: 'Sitio minimalista para empresa de realidad virtual.',
    tech: ['Next.js', 'TailwindCSS'],
    repoUrl: 'https://github.com/saul/landing-vr',
  ),
  Project(
    title: 'Dashboard Administrativo',
    description: 'Panel para control de inventarios y usuarios.',
    tech: ['React', 'Node.js'],
    repoUrl: 'https://github.com/saul/dashboard-admin',
    screenshotPath: 'assets/images/demo1.jpg',
  ),
];

class Project {
  final String title;
  final String description;
  final List<String> tech;
  final String repoUrl;
  final String? screenshotPath; // Ruta local (assets) o red (URL)

  Project({
    required this.title,
    required this.description,
    required this.tech,
    required this.repoUrl,
    this.screenshotPath,
  });
}
