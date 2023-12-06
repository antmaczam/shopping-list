import '../api/item_api.dart';
import '../models/item.dart';

class ItemService {

  static Future<void> sendItemToHomeList(List<Item> items) async {
    for (var item in items) {
      await ItemApi.updateItem(item.id, {'inCart': false});
    }
  }

}