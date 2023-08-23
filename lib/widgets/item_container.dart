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
      color: primaryColor,
      child: Row(
        children: [
          Column(
            children: [
              Text(widget.item.title),
              Text(widget.item.description),
            ]
          ),
          Text('${widget.item.quantity}')
        ],
      ),
    );
  }

}