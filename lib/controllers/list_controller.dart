import 'package:flutter/material.dart';
import 'package:shopping_list/api/item_api.dart';
import 'package:shopping_list/services/item_service.dart';

import '../models/item.dart';

class ListController extends ChangeNotifier {
  List<Item> _homeList = <Item>[];
  List<Item> _shopList = <Item>[];

  void changeToShopList(Item item) async {
    item.initToShopList();
    _shopList.add(item);
    _homeList.remove(item);
    await ItemApi.updateItem(item.id, item.inCartToJson());
    notifyListeners();
  }

  void clearShopList() async {
    List<Item> listToClear = _shopList.where((item) => item.check).toList();
    await ItemService.sendItemToHomeList(listToClear);
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

  Future<List<Item>> getCartList() async {
    _shopList = await ItemApi.getItemsInCart();
    return _shopList;
  }

}