import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/list_controller.dart';

class ItemForm extends StatefulWidget {
  const ItemForm({super.key});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  String _title = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    ListController listController = Provider.of<ListController>(context);
    return SimpleDialog(
        title: const Text('Crear nuevo item'),
        contentPadding: const EdgeInsets.all(40),
        children: [
          const Text('Título'),
          TextField(onChanged: (value) => _title = value),
          const Padding(padding: EdgeInsets.all(10)),
          const Text('Descripción'),
          TextField(onChanged: (value) => _description = value),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Cancelar')
                ),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context, true);
                      await listController.createItem(_title, _description);
                    },
                    child: const Text('Guardar')
                )
              ]
          )
        ]
    );
  }

}
