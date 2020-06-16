/*
diy项目类，说明diy项目的对象属性
*/

class DiyProject {
  int _id; //项目id
  String _name; //项目名字
  String _date; //项目时间
  String _place; //项目地点
  String _contact; //项目联系人
  String _notes; //项目备注

  int _singlePrice; //项目单价
  int _nums; //项目份数
  int _totalAmount; //项目总价
  int _itemCost; //物料成本
  int _laborCost; //人员成本
  int _profit; //项目利润
  int _unPaidAmount; //未结欠款

  bool _isPaided; // 钱款是否已结

  //活动项目构造函数
  DiyProject(
    this._name,
    this._date,
    this._place,
    this._contact,
    this._singlePrice,
    this._nums,
    this._totalAmount,
    this._itemCost,
    this._laborCost,
    this._profit,
    this._unPaidAmount,
    this._isPaided,
    this._notes,
  );

  /*
  下面是获取活动项目各属性值得方法
  */
  String get name => _name;

  String get date => _date;

  String get place => _place;

  String get contact => _contact;

  // String get imagePath => _imagePath;
  String get notes => _notes;

  int get id => _id;

  int get singlePrcie => _singlePrice;

  int get nums => _nums;

  int get totalAmount => _totalAmount;

  int get itemCost => _itemCost;

  int get laborCost => _laborCost;

  int get profit => _profit;

  int get unPaidAmount => _unPaidAmount;

  bool get isPaided => _isPaided;

  setIsPaided(bool value) {
    _isPaided = value;
  }

  Map<String, dynamic> toMap() {
    Map map = <String, dynamic>{
      'name': _name,
      'date': _date,
      'place': _place,
      'contact': _contact,
      'singlePrice': _singlePrice,
      'nums': _nums,
      'totalAmount': _totalAmount,
      'itemCost': _itemCost,
      'laborCost': _laborCost,
      'profit': _profit,
      'unPaidAmount': _unPaidAmount,
      'isPaided': _isPaided == true ? '1' : '0',
      'notes': _notes,
    };
    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  DiyProject.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _date = map['date'];
    _place = map['place'];
    _contact = map['contact'];
    _singlePrice = map['singlePrice'];
    _nums = map['nums'];
    _totalAmount = map['totalAmount'];
    _itemCost = map['itemCost'];
    _laborCost = map['laborCost'];
    _profit = map['profit'];
    _unPaidAmount = map['unPaidAmount'];
    _isPaided = map['isPaided'] == '1' ? true : false;
    _notes = map['notes'];
  }
}
