import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/list_controller.dart';
import '../models/item.dart';

class ItemForm extends StatefulWidget {
  const ItemForm({super.key});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    ListController listController = Provider.of<ListController>(context);


    return SimpleDialog(
        title: const Text('Crear nuevo item'),
        contentPadding: EdgeInsets.all(40),
        children: [
          const Text('Título'),
          TextField(controller: _titleController),
          const Padding(padding: EdgeInsets.all(10)),
          const Text('Descripción'),
          TextField(controller: _descriptionController),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Cancelar')
                ),
                ElevatedButton(
                    onPressed: () {
                      listController.addHomeList(Item.create(_titleController.text, _descriptionController.text));
                      Navigator.pop(context, true);
                    },
                    child: const Text('Guardar')
                )
              ]
          )
        ]
    );
  }
}

/*class ItemForm extends StatelessWidget {

  const ItemForm({super.key});

  @override
  Widget build(BuildContext context) {

    ItemController itemController = Provider.of<ItemController>(context);
    ListController listController = Provider.of<ListController>(context);

    return SimpleDialog(
      title: const Text('Crear nuevo item'),
      contentPadding: EdgeInsets.all(40),
      children: [
        const Text('Título'),
        TextField(controller: itemController.titleController),
        const Padding(padding: EdgeInsets.all(10)),
        const Text('Descripción'),
        TextField(controller: itemController.descriptionController),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Cancelar')
            ),
            ElevatedButton(
                onPressed: () {
                  listController.addHomeList(itemController.createItem());
                  Navigator.pop(context, true);
                },
                child: const Text('Guardar')
            )
          ]
        )
      ]
    );
  }

}*/
