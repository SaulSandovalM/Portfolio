import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/widgets/custom_card.dart';
import 'package:portafolio/models/course_model.dart';
import 'package:portafolio/screens/courses/widgets/course_card.dart';
import 'package:portafolio/providers/courses_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CourseProvider>(context);
    final categories = provider.categories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cursos',
          style: TextStyle(
            color: CustomColor.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        for (final category in categories) ...[
          Text(
            category,
            style: const TextStyle(
              color: CustomColor.accent,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          _CourseGrid(courses: provider.coursesByCategory(category)),
          const SizedBox(height: 32),
        ],
      ],
    );
  }
}

class _CourseGrid extends StatelessWidget {
  final List<Course> courses;

  const _CourseGrid({required this.courses});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
          itemCount: courses.length,
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
                        : 0.6,
          ),
          itemBuilder: (context, index) {
            return CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      courses[index].coverPath,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    courses[index].title,
                    style: const TextStyle(
                      color: CustomColor.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    courses[index].description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: CustomColor.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: courses[index]
                        .tech
                        .map((tech) => Chip(
                              label: Text(tech),
                              backgroundColor:
                                  CustomColor.accent.withOpacity(0.1),
                              labelStyle: const TextStyle(
                                color: CustomColor.accent,
                                fontSize: 12,
                              ),
                              side: BorderSide.none,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton.icon(
                      onPressed: () async {
                        final uri = Uri.parse(courses[index].url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      },
                      icon: const Icon(Icons.play_circle_outline, size: 16),
                      label: const Text('Ir al curso'),
                      style: TextButton.styleFrom(
                        foregroundColor: CustomColor.accent,
                      ),
                    ),
                  ),
                ],
              ),
            );
            // CourseCard(course: courses[index]);
          },
        );
      },
    );
  }
}
