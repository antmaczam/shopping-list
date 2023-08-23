import 'package:flutter/material.dart';

import '../models/item.dart';

class ListController extends ChangeNotifier {

  List<Item> homeList = [
    Item(0, 'Yogurt', 'Lacteo rico', 3, false),
    Item(1, 'Chorizo', 'Chacina rica', 2, false),
    Item(2, 'Pan', 'Trigo rico', 5, false),
    Item(3, 'Croquetas', 'Frituria rica', 10, false),
  ];
  List<Item> shopList = [];

  void changeToShopList(Item item) {
    shopList.add(item);
    homeList.remove(item);
    notifyListeners();
  }

  void clearShopList() {
    homeList = List.from(homeList)..addAll(shopList);
    shopList.clear();
    notifyListeners();
  }

}