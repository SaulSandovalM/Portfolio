import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DataProvider<T> with ChangeNotifier {
  final String collectionName; // Nombre de la colección en Firebase
  final T Function(QueryDocumentSnapshot) fromFirestore; // Convertidor genérico

  List<T>? _items;
  bool _isLoading = false;

  List<T>? get items => _items;
  bool get isLoading => _isLoading;

  DataProvider({
    required this.collectionName,
    required this.fromFirestore,
  });

  Future<void> fetchData() async {
    if (_items != null) return; // Evitar recargar si ya tenemos datos

    _isLoading = true;
    notifyListeners();

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .orderBy('createdAt', descending: false)
          .get();

      _items = snapshot.docs.map(fromFirestore).toList();
    } catch (e) {
      _items = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearCache() {
    _items = null; // Limpiar los datos si se necesita refrescar
  }
}
