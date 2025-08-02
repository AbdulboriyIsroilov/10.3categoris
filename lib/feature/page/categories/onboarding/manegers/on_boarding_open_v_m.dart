import 'package:flutter/material.dart';
import '../../../../../../utils/client.dart';

class OnBoardingOpenVM extends ChangeNotifier {
  OnBoardingOpenVM() {
    fetchAllergic();
  }

  bool loading = true;
  List onBOpen = [];

  Future<void> fetchAllergic() async {
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/onboarding/list");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    onBOpen = reseponse.data;
    loading = false;
    notifyListeners();
  }
}
