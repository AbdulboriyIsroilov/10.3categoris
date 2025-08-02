import 'package:flutter/material.dart';

import '../../../../../../utils/client.dart';

class PreferencesViewModel extends ChangeNotifier{
  PreferencesViewModel(){
    fetchPreferences();
  }
  int activIndex = 1;
  List preferences = [];
  bool loading = true;

  Future<void> fetchPreferences() async {
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/cuisines/list");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    preferences = reseponse.data;
    loading = false;
    notifyListeners();
  }

}
