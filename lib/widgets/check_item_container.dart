import 'package:flutter/material.dart';
import 'package:shopping_list/constants/colors.dart';

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
      color: primaryColor,
      child: Row(
        children: [
          Checkbox(
            value: widget.item.check,
            onChanged: (bool? value) => setState(() => widget.item.setCheck(value))
          ),
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