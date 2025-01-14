import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ConferencesProvider with ChangeNotifier {
  List<QueryDocumentSnapshot>? _conferences;
  bool _isLoading = false;

  List<QueryDocumentSnapshot>? get conferences => _conferences;
  bool get isLoading => _isLoading;

  Future<void> fetchConferences() async {
    if (_conferences != null) return;

    _isLoading = true;
    notifyListeners();

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('conferences')
          .orderBy('createdAt', descending: false)
          .get();

      _conferences = snapshot.docs;
    } catch (e) {
      _conferences = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
