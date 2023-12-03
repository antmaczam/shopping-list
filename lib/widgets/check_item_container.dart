import 'package:flutter/material.dart';
import 'package:shopping_list/constants/colors.dart';
import 'package:shopping_list/widgets/item_container.dart';

import '../models/item.dart';
class CheckItemContainer extends StatefulWidget {

  final Item item;
  const CheckItemContainer({super.key, required this.item});

  @override
  State<CheckItemContainer> createState() => _CheckItemContainerState();
}

class _CheckItemContainerState extends State<CheckItemContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: boxColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                  value: widget.item.check,
                  onChanged: (bool? value) => setState(() => widget.item.setCheck(value))
              ),
              ItemContainer(item: widget.item)
            ]
          ),
          IconButton(
            onPressed: () => setState(() => widget.item.addUnit()),
            icon: const Icon(Icons.add)
          ),
          Text('${widget.item.quantity}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          IconButton(
            onPressed: widget.item.quantity > 1 ? () => setState(() => widget.item.removeUnit()) : null,
            icon: const Icon(Icons.remove)
          ),
        ],
      ),
    );
  }

}