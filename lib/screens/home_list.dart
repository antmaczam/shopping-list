import 'package:flutter/material.dart';
import 'package:shopping_list/constants/colors.dart';

import '../models/item.dart';
import '../widgets/bottom_bar.dart';

class HomeList extends StatelessWidget {

  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> items = [
      Item('Yogurt', 'Lacteo rico', 3),
      Item('Chorizo', 'Lacteo rico', 2),
      Item('Pan', 'Lacteo rico', 5),
      Item('Croquetas', 'Lacteo rico', 10),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Home list')
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8),
            color: Colors.amber,
            child: Column(
              children: [
                Text(items[index].title),
                Text(items[index].description),
                Text('${items[index].quantity}'),
              ]
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomBar()
    );
  }

}