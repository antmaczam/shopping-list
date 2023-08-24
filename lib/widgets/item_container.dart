import 'package:flutter/material.dart';
import 'package:shopping_list/constants/colors.dart';

import '../models/item.dart';

class ItemContainer extends StatefulWidget {

  final Item item;
  const ItemContainer({super.key, required this.item});

  @override
  State<ItemContainer> createState() => _CheckItemContainerState();
}

class _CheckItemContainerState extends State<ItemContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      color: boxColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Text(widget.item.description),
        ]
      )
    );
  }

}