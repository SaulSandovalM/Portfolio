import 'package:flutter/material.dart';
import 'package:portafolio/models/course_model.dart';
import 'package:provider/provider.dart';
import 'package:portafolio/providers/courses_provider.dart';
import 'package:portafolio/screens/courses/widgets/course_card.dart';
import 'package:portafolio/core/constants/colors.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  void initState() {
    super.initState();
    Provider.of<CourseProvider>(context, listen: false).loadCourses();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CourseProvider>(context);
    final categories = provider.categories;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
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

          // Secciones por categoría
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
      ),
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
            : constraints.maxWidth > 700
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
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            return CourseCard(course: courses[index]);
          },
        );
      },
    );
  }
}
