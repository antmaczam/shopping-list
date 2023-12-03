import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/constants/colors.dart';
import 'package:shopping_list/widgets/item_container.dart';
import 'package:shopping_list/widgets/item_form.dart';

import '../controllers/list_controller.dart';
import '../widgets/bottom_bar.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    ListController listController = Provider.of<ListController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Home list')
      ),
      body: FutureBuilder(
        future: listController.getHomeList(),
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
                    child: ItemContainer(item: items[index])
                );
              },
            );
          }else {
            return const CircularProgressIndicator();
          }
        }
      ),
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openDialog(context),
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _openDialog(BuildContext context) async {
    await showDialog(context: context, builder: (BuildContext context) => const ItemForm());
  }

}