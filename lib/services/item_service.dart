import '../api/item_api.dart';
import '../models/item.dart';

class ItemService {

  static Future<void> sendItemToHomeList(List<Item> items) async {
    for (var item in items) {
      await ItemApi.updateItem(item.id, {'inCart': false});
    }
  }

  static Future<void> createItem(String organizationId, String title, String description) async {
    final payload = {
      'check': false,
      'description': description,
      'inCart': false,
      'quantity': 1,
      'title': title
    };
    await ItemApi.createItem(organizationId, payload);
  }

}