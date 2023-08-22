import 'package:flutter/material.dart';

import '../models/item.dart';

class ListController extends ChangeNotifier {

  List<Item> homeList = [
    Item(0, 'Yogurt', 'Lacteo rico', 3),
    Item(1, 'Chorizo', 'Lacteo rico', 2),
    Item(2, 'Pan', 'Lacteo rico', 5),
    Item(3, 'Croquetas', 'Lacteo rico', 10),
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
    print(homeList);
    print(shopList);
    notifyListeners();
  }
}