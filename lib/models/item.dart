class Item {

  late String _id;
  late String _title;
  late String _description;
  late int _quantity;
  late bool _check;
  late bool _inCart;

  String get id => _id;
  String get title => _title;
  String get description => _description;
  int get quantity => _quantity;
  bool get check => _check;
  bool get inCart => _inCart;

  Item(id, title, description, quantity, check) {
    _id = id;
    _title = title;
    _description = description;
    _quantity = quantity;
    _check = check;
  }

  Item.fromJson(String id, Map<String,dynamic> json) {
    _id = id;
    _title = json['title'];
    _description = json['description'];
    _quantity = json['quantity'];
    _check = json['check'];
    _inCart = json['inCart'];
  }

  Item.init() {
    _id = '0';
    _title = '';
    _description = '';
    _quantity = 1;
    _check = false;
  }

  Item.create(String title, String description) {
    _id = '0';
    _title = title;
    _description = description;
    _quantity = 1;
    _check = false;
  }

  void setCheck(bool? value) {
    _check = value ?? false;
  }

  void initToShopList() {
    _quantity = 1;
    _check = false;
    _inCart = true;
  }

  void addUnit() {
    _quantity++;
  }

  void removeUnit() {
    _quantity--;
  }

  Map<String, Object?> inCartToJson() {
    return {'inCart': _inCart};
  }
}