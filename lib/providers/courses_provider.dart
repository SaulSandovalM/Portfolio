// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';

// class CourseProvider with ChangeNotifier {
//   List<QueryDocumentSnapshot>? _courses;
//   bool _isLoading = false;

//   List<QueryDocumentSnapshot>? get courses => _courses;
//   bool get isLoading => _isLoading;

//   Future<void> fetchCourses({String? type}) async {
//     if (_courses != null) return; // Evitar recargar si ya tenemos datos

//     _isLoading = true;
//     notifyListeners();

//     try {
//       final snapshot = await FirebaseFirestore.instance
//           .collection('courses')
//           .where('type', isEqualTo: type)
//           .orderBy('createdAt', descending: false)
//           .get();

//       _courses = snapshot.docs;
//     } catch (e) {
//       _courses = [];
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CourseProvider with ChangeNotifier {
  final Map<String, List<QueryDocumentSnapshot>> _coursesByType = {};
  bool _isLoading = false;

  List<QueryDocumentSnapshot>? getCoursesByType(String type) =>
      _coursesByType[type];
  bool get isLoading => _isLoading;

  Future<void> fetchCourses({required String type}) async {
    if (_coursesByType.containsKey(type)) {
      return; // Evitar recargar si ya tenemos datos
    }

    _isLoading = true;
    notifyListeners();

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('courses')
          .where('type', isEqualTo: type)
          .orderBy('createdAt', descending: false)
          .get();

      _coursesByType[type] = snapshot.docs;
    } catch (e) {
      _coursesByType[type] = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
