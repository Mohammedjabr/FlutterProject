class Order {
  String _id;
  String _name;
  String _price;
  String _category;
  String _description;


  Order(this._id, this._name, this._price, this._category, this._description);

  Order.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['Name'];
    this._price = obj['Price'];
    this._category = obj['Category'];
    this._description = obj['Description'];
  }

  String get id => _id;

  String get name => _name;

  String get price => _price;

  String get category => _category;

  String get description => _description;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["Name"] = _name;
    map["Price"] = _price;
    map["Category"] = _category;
    map["Description"] = _description;

    return map;
  }
}