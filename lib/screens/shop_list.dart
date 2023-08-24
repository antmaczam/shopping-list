import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/constants/colors.dart';
import 'package:shopping_list/widgets/check_item_container.dart';

import '../controllers/list_controller.dart';
import '../models/item.dart';
import '../widgets/bottom_bar.dart';

class ShopList extends StatelessWidget {

  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    ListController listController = Provider.of<ListController>(context);
    List<Item> items = listController.shopList;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            title: const Text('Shop list')
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckItemContainer(item: items[index]);
          },
        ),
        bottomNavigationBar: const BottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => listController.clearShopList(),
        backgroundColor: primaryColor,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

}