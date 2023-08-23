class Item {

  late int _id;
  late String _title;
  late String _description;
  late int _quantity;
  late bool _check;

  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get quantity => _quantity;
  bool get check => _check;

  Item(id, title, description, quantity, check) {
    _id = id;
    _title = title;
    _description = description;
    _quantity = quantity;
    _check = _check;
  }

  void setCheck(bool value) {
    _check = value;
  }

}