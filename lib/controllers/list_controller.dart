import 'package:flutter/material.dart';
import 'package:shopping_list/api/item_api.dart';

import '../models/item.dart';

class ListController extends ChangeNotifier {

  List<Item> _homeList = <Item>[];
  List<Item> shopList = <Item>[];

  void changeToShopList(Item item) async {
    item.initToShopList();
    shopList.add(item);
    _homeList.remove(item);
    await ItemApi.updateItem(item.id, item.inCartToJson());
    notifyListeners();
  }

  void clearShopList() {
    List<Item> listToClear = shopList.where((item) => item.check).toList();
    _homeList = List.from(_homeList)..addAll(listToClear);
    shopList.removeWhere((item) => item.check);
    notifyListeners();
  }

  void addHomeList(Item item) {
    _homeList.add(item);
    notifyListeners();
  }

  Future<List<Item>> getHomeList() async {
    _homeList = await ItemApi.getItemsNotInCart();
    return _homeList;
  }

}