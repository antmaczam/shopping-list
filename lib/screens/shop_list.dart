import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/constants/colors.dart';
import 'package:shopping_list/widgets/check_item_container.dart';

import '../controllers/list_controller.dart';
import '../widgets/bottom_bar.dart';

class ShopList extends StatelessWidget {

  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    ListController listController = Provider.of<ListController>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Shop list')
      ),
      body: FutureBuilder(
          future: listController.getCartList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasError) {
              return const Text('Hubo un error, inténtelo más tarde');
            }else if(snapshot.hasData) {
              final items = snapshot.data;
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () => listController.changeToShopList(items[index]),
                      child:  CheckItemContainer(item: items[index])
                  );
                },
              );
            }else {
              return const CircularProgressIndicator();
            }
          }
      ),
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: AsyncButtonBuilder(
        onPressed: () async => await listController.clearShopList(),
        builder: (context, child, callback, _) => TextButton(onPressed: callback, child: child),
        child: const Icon(Icons.shopping_cart, color: primaryColor)
      )
    );
  }

}