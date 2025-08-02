import 'package:flutter/material.dart';

import '../../../../../utils/client.dart';

class PreferencesViewModel extends ChangeNotifier{
  PreferencesViewModel(){
    fetchPreferences();
  }
  int activIndex = 1;
  List preferences = [];

  Future<void> fetchPreferences() async {
    var reseponse = await dio.get("/cuisines/list");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    preferences = reseponse.data;
  }
  void skip(){
    if (activIndex<=2){
      activIndex++;
      notifyListeners();
    }
  }
  void minus(){
    if (activIndex>0&&activIndex<=2) {
      activIndex--;
      notifyListeners();
    }  
  }
}
