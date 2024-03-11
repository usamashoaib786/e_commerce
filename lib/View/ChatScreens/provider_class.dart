import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class NotifyProvider extends ChangeNotifier {
  bool isCustom = false;
  bool field = false;
  bool sheet = false;

  String bidPrice = "";
  int? indexbid;

  openclose() {
    isCustom = !isCustom;
    notifyListeners();
  }

  bidPrices({price}) {
    bidPrice = price;
    field = false;

    notifyListeners();
  }

  index({index}) {
    indexbid = index;
    notifyListeners();
  }

  makeField() {
    field = true;
    notifyListeners();
  }

  sheetTrue() {
    sheet = true;
    notifyListeners();
  }

  sheetFalse() {
    sheet = false;
    notifyListeners();
  }
}
