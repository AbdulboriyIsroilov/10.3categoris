import 'package:flutter/material.dart';

import '../../../../../utils/client.dart';

class ExpordPageViewMudel extends ChangeNotifier{
  ExpordPageViewMudel({required int categoryId}){
    fetchRecipes(categoryId: categoryId);
  }

  List expordcategoris = [];
  bool loading = true;

  Future<void> fetchRecipes({required int categoryId}) async {
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/recipes/list?Category=$categoryId");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    expordcategoris = reseponse.data;
    loading = false;
    notifyListeners();
  }
}