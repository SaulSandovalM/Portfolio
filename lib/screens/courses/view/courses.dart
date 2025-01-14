import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:portafolio/screens/courses/widgets/main_courses.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainContainer(
      child: Column(
        children: [
          SizedBox(height: 40),
          MainCourses(),
        ],
      ),
    );
  }
}
