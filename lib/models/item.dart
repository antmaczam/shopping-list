class Item {

  late int _id;
  late String _title;
  late String _description;
  late int _quantity;

  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get quantity => _quantity;

  set id(int value) => _id = value;
  set title(String value) => _title = value;
  set description(String value) => _description = value;
  set quantity(int value) => _quantity = value;

  Item(id, title, description, quantity) {
    _id = id;
    _title = title;
    _description = description;
    _quantity = quantity;
  }

}