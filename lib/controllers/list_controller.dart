import 'package:flutter/material.dart';

import '../models/item.dart';

class ListController extends ChangeNotifier {

  List<Item> homeList = [
    Item(0, 'Yogurt', 'Lacteo rico', 3, false),
    Item(1, 'Chorizo', 'Chacina rica', 2, false),
    Item(2, 'Pan', 'Trigo rico', 5, false),
    Item(3, 'Croquetas', 'Frituria rica', 10, true),
  ];
  List<Item> shopList = [];

  void changeToShopList(Item item) {
    item.initToShopList();
    shopList.add(item);
    homeList.remove(item);
    notifyListeners();
  }

  void clearShopList() {
    List<Item> listToClear = shopList.where((item) => item.check).toList();
    homeList = List.from(homeList)..addAll(listToClear);
    shopList.removeWhere((item) => item.check);
    notifyListeners();
  }

  void creteItem(String title, String description) {
    Item newItem = Item(4, title, description, 1, false);
    homeList.add(newItem);
    notifyListeners();
  }

}