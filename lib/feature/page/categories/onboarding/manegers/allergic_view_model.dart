import 'package:flutter/material.dart';

import '../../../../../../utils/client.dart';

class AllergicViewModel extends ChangeNotifier{
  AllergicViewModel() {
    fetchAllergic();
  }
  int activIndex = 2;
  List allergic = [];
  bool loading = true;

  Future<void> fetchAllergic() async {
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/allergic/list");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    allergic = reseponse.data;
    loading = false;
    notifyListeners();
  }
}
