import 'package:flutter/material.dart';

import '../../../../../utils/client.dart';

class MyscaffoldViewModul extends ChangeNotifier {
  MyscaffoldViewModul() {
    fetchCategories();
  }

  bool loading = true;
  List mycategoris = [];

  Future<void> fetchCategories() async {
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/categories/list");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    mycategoris = reseponse.data;
    loading = false;
    notifyListeners();
  }
}
