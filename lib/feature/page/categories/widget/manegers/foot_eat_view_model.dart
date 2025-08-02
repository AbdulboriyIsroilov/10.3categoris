import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../../../utils/client.dart';

class FootEatViewMudel extends ChangeNotifier{
  FootEatViewMudel({required int id}){
    fetchDetail(categoryId: id);
  }

  Map footcotegoris = {};
  bool loading = true;

  Future<void> fetchDetail({required int categoryId}) async {
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/recipes/detail/$categoryId");
    print(reseponse.data);
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    footcotegoris = reseponse.data;
    loading = false;
    notifyListeners();

  }
}
