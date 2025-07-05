import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:portafolio/providers/courses_provider.dart';
import 'package:portafolio/screens/courses/widgets/courses_section.dart';
import 'package:provider/provider.dart';

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
    return const MainContainer(
      child: CoursesSection(),
    );
  }
}
