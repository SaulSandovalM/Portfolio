import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/widgets/custom_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = _mockProjects;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Proyectos',
          style: TextStyle(
            color: CustomColor.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 1000
                ? 3
                : constraints.maxWidth > 600
                    ? 2
                    : constraints.maxWidth > 580
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
                  childAspectRatio: constraints.maxWidth > 1000
                      ? 1
                      : constraints.maxWidth > 600
                          ? 1.2
                          : constraints.maxWidth > 580
                              ? 0.7
                              : 0.6),
              itemBuilder: (context, index) {
                return _ProjectCard(project: projects[index]);
              },
            );
          },
        ),
      ],
    );
  }
}

final List<_Project> _mockProjects = [
  _Project(
    title: 'Sistema de Reservas',
    description: 'App web para gestionar reservas de espacios y citas.',
    tech: ['Flutter', 'Firebase'],
    repoUrl: 'https://github.com/saul/sistema-reservas',
  ),
  _Project(
    title: 'Landing Page VR',
    description: 'Sitio minimalista para empresa de realidad virtual.',
    tech: ['Next.js', 'TailwindCSS'],
    repoUrl: 'https://github.com/saul/landing-vr',
  ),
  _Project(
    title: 'Dashboard Administrativo',
    description: 'Panel para control de inventarios y usuarios.',
    tech: ['React', 'Node.js'],
    repoUrl: 'https://github.com/saul/dashboard-admin',
    screenshotPath: 'assets/images/demo1.jpg',
  ),
];

class _Project {
  final String title;
  final String description;
  final List<String> tech;
  final String repoUrl;
  final String? screenshotPath;

  _Project({
    required this.title,
    required this.description,
    required this.tech,
    required this.repoUrl,
    this.screenshotPath,
  });
}

class _ProjectCard extends StatefulWidget {
  final _Project project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.project.screenshotPath != null)
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        widget.project.screenshotPath!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.project.screenshotPath!,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(height: 16),
          Text(
            widget.project.title,
            style: const TextStyle(
              color: CustomColor.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.project.description,
            style: TextStyle(
              color: CustomColor.textSecondary,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: widget.project.tech
                .map((tech) => Chip(
                      label: Text(tech),
                      backgroundColor: CustomColor.backgroundWrap,
                      labelStyle: const TextStyle(
                        color: CustomColor.textWrap,
                        fontSize: 12,
                      ),
                      // side: BorderSide.none,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton.icon(
              onPressed: () async {
                final uri = Uri.parse(widget.project.repoUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              icon: const Icon(
                Icons.link,
                size: 16,
                color: Colors.white,
              ),
              label: const Text('Ver repo'),
              style: TextButton.styleFrom(
                foregroundColor: CustomColor.textWrap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
