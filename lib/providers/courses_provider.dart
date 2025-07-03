import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portafolio/models/course_model.dart';

class CourseProvider extends ChangeNotifier {
  final List<Course> _courses = [];
  List<Course> get courses => _courses;

  Future<void> loadCourses() async {
    final query = await FirebaseFirestore.instance.collection('courses').get();
    _courses.clear();
    for (var doc in query.docs) {
      final data = doc.data();
      _courses.add(
        Course(
          title: data['title'],
          description: data['description'],
          tech: List<String>.from(data['tech']),
          coverPath: data['coverPath'],
          url: data['url'],
          category: data['category'],
        ),
      );
    }
    notifyListeners();
  }

  List<String> get categories =>
      _courses.map((e) => e.category).toSet().toList();

  List<Course> coursesByCategory(String category) =>
      _courses.where((e) => e.category == category).toList();
}
