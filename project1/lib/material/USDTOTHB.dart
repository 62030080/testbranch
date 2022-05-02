import 'dart:convert';
/// date : "2022-05-02"
/// info : {"rate":34.389929,"timestamp":1651473183}
/// query : {"amount":5,"from":"USD","to":"THB"}
/// result : 171.949645
/// success : true

Usdtothb usdtothbFromJson(String str) => Usdtothb.fromJson(json.decode(str));
String usdtothbToJson(Usdtothb data) => json.encode(data.toJson());
class Usdtothb {
  Usdtothb({
      String? date, 
      Info? info, 
      Query? query, 
      double? result, 
      bool? success,}){
    _date = date;
    _info = info;
    _query = query;
    _result = result;
    _success = success;
}

  Usdtothb.fromJson(dynamic json) {
    _date = json['date'];
    _info = json['info'] != null ? Info.fromJson(json['info']) : null;
    _query = json['query'] != null ? Query.fromJson(json['query']) : null;
    _result = json['result'];
    _success = json['success'];
  }
  String? _date;
  Info? _info;
  Query? _query;
  double? _result;
  bool? _success;
Usdtothb copyWith({  String? date,
  Info? info,
  Query? query,
  double? result,
  bool? success,
}) => Usdtothb(  date: date ?? _date,
  info: info ?? _info,
  query: query ?? _query,
  result: result ?? _result,
  success: success ?? _success,
);
  String? get date => _date;
  Info? get info => _info;
  Query? get query => _query;
  double? get result => _result;
  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    if (_info != null) {
      map['info'] = _info?.toJson();
    }
    if (_query != null) {
      map['query'] = _query?.toJson();
    }
    map['result'] = _result;
    map['success'] = _success;
    return map;
  }

}

/// amount : 5
/// from : "USD"
/// to : "THB"

Query queryFromJson(String str) => Query.fromJson(json.decode(str));
String queryToJson(Query data) => json.encode(data.toJson());
class Query {
  Query({
      int? amount, 
      String? from, 
      String? to,}){
    _amount = amount;
    _from = from;
    _to = to;
}

  Query.fromJson(dynamic json) {
    _amount = json['amount'];
    _from = json['from'];
    _to = json['to'];
  }
  int? _amount;
  String? _from;
  String? _to;
Query copyWith({  int? amount,
  String? from,
  String? to,
}) => Query(  amount: amount ?? _amount,
  from: from ?? _from,
  to: to ?? _to,
);
  int? get amount => _amount;
  String? get from => _from;
  String? get to => _to;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['from'] = _from;
    map['to'] = _to;
    return map;
  }

}

/// rate : 34.389929
/// timestamp : 1651473183

Info infoFromJson(String str) => Info.fromJson(json.decode(str));
String infoToJson(Info data) => json.encode(data.toJson());
class Info {
  Info({
      double? rate, 
      int? timestamp,}){
    _rate = rate;
    _timestamp = timestamp;
}

  Info.fromJson(dynamic json) {
    _rate = json['rate'];
    _timestamp = json['timestamp'];
  }
  double? _rate;
  int? _timestamp;
Info copyWith({  double? rate,
  int? timestamp,
}) => Info(  rate: rate ?? _rate,
  timestamp: timestamp ?? _timestamp,
);
  double? get rate => _rate;
  int? get timestamp => _timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = _rate;
    map['timestamp'] = _timestamp;
    return map;
  }

}