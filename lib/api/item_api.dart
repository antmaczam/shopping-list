import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/item.dart';

class ItemApi {

  static Future<List<Item>> getAllItemsByOrganization() async {
    final snapshot = await FirebaseFirestore.instance.collection('items').get();
    return snapshot.docs.map((doc) => Item.fromJson(doc.id, doc.data())).toList();
  }

  static Future<List<Item>> getItemsNotInCart() async {
    final snapshot = await FirebaseFirestore.instance.collection('items').where('inCart', isEqualTo: false).get();
    return snapshot.docs.map((doc) => Item.fromJson(doc.id, doc.data())).toList();
  }

  static Future<List<Item>> getItemsInCart() async {
    final snapshot = await FirebaseFirestore.instance.collection('items').where('inCart', isEqualTo: true).get();
    return snapshot.docs.map((doc) => Item.fromJson(doc.id, doc.data())).toList();
  }

  static Future<void> updateItem(String itemId, Map<String,Object?> fieldsToUpdate) async {
    final itemRef = FirebaseFirestore.instance.collection('items').doc(itemId);
    await itemRef.update(fieldsToUpdate);
  }

}