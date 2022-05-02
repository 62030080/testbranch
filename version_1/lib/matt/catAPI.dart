import 'dart:convert';
/// breeds : []
/// id : "MTUxODAyOQ"
/// url : "https://cdn2.thecatapi.com/images/MTUxODAyOQ.jpg"
/// width : 900
/// height : 644

CatApi catApiFromJson(String str) => CatApi.fromJson(json.decode(str));
String catApiToJson(CatApi data) => json.encode(data.toJson());
class CatApi {
  CatApi({
      List<dynamic>? breeds, 
      String? id, 
      String? url, 
      int? width, 
      int? height,}){
    _breeds = breeds;
    _id = id;
    _url = url;
    _width = width;
    _height = height;
}

  CatApi.fromJson(dynamic json) {
    if (json['breeds'] != null) {
      _breeds = [];
      json['breeds'].forEach((v) {
        _breeds?.add(Dynamic.fromJson(v));
      });
    }
    _id = json['id'];
    _url = json['url'];
    _width = json['width'];
    _height = json['height'];
  }
  List<dynamic>? _breeds;
  String? _id;
  String? _url;
  int? _width;
  int? _height;

  get Dynamic => null;
CatApi copyWith({  List<dynamic>? breeds,
  String? id,
  String? url,
  int? width,
  int? height,
}) => CatApi(  breeds: breeds ?? _breeds,
  id: id ?? _id,
  url: url ?? _url,
  width: width ?? _width,
  height: height ?? _height,
);
  List<dynamic>? get breeds => _breeds;
  String? get id => _id;
  String? get url => _url;
  int? get width => _width;
  int? get height => _height;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_breeds != null) {
      map['breeds'] = _breeds?.map((v) => v.toJson()).toList();
    }
    map['id'] = _id;
    map['url'] = _url;
    map['width'] = _width;
    map['height'] = _height;
    return map;
  }

}