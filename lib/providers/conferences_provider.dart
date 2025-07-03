import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portafolio/models/conference_model.dart';

class ConferencesProvider extends ChangeNotifier {
  final List<Conference> _conferences = [];

  List<Conference> get conferences => _conferences;

  Future<void> loadConferences() async {
    final query =
        await FirebaseFirestore.instance.collection('conferences').get();
    _conferences.clear();
    for (var doc in query.docs) {
      final data = doc.data();
      _conferences.add(
        Conference(
          title: data['title'] ?? '',
          description: data['description'] ?? '',
          image: data['image'] ?? '',
          location: data['location'] ?? '',
          date: data['date'] ?? '',
          videoUrl: data['videoUrl'] ?? '',
          category: data['category'] ?? 'General',
        ),
      );
    }
    notifyListeners();
  }

  List<String> get categories =>
      _conferences.map((e) => e.category).toSet().toList();

  List<Conference> conferencesByCategory(String category) =>
      _conferences.where((c) => c.category == category).toList();
}
