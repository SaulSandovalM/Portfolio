import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CourseProvider with ChangeNotifier {
  List<QueryDocumentSnapshot>? _courses;
  bool _isLoading = false;

  List<QueryDocumentSnapshot>? get courses => _courses;
  bool get isLoading => _isLoading;

  Future<void> fetchCourses() async {
    if (_courses != null) return; // Evitar recargar si ya tenemos datos

    _isLoading = true;
    notifyListeners();

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('courses')
          .orderBy('createdAt', descending: false)
          .get();

      _courses = snapshot.docs;
    } catch (e) {
      _courses = []; // En caso de error, definir como lista vacía
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
