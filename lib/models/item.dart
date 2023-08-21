class Item {

  late String _title;
  late String _description;
  late int _quantity;

  String get title => _title;
  String get description => _description;
  int get quantity => _quantity;

  set title(String value) => _title = value;
  set description(String value) => _description = value;
  set quantity(int value) => _quantity = value;

  Item(title, description, quantity) {
    _title = title;
    _description = description;
    _quantity = quantity;
  }

}