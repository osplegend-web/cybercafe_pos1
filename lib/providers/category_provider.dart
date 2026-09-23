import 'package:flutter/foundation.dart';

import '../models/category.dart';
import '../services/category_repository.dart';

class CategoryProvider extends ChangeNotifier {
  final _repo = CategoryRepository();
  List<Category> categories = [];
  bool loading = false;

  Future<void> load() async {
    loading = true;
    notifyListeners();
    categories = await _repo.getAll();
    loading = false;
    notifyListeners();
  }

  Future<void> add(String name) async {
    await _repo.add(name);
    await load();
  }

  Future<void> update(Category category) async {
    await _repo.update(category);
    await load();
  }

  Future<void> delete(int id) async {
    await _repo.delete(id);
    await load();
  }
}
