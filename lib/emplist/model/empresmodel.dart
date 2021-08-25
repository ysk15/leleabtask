import 'package:hive/hive.dart';
part 'empresmodel.g.dart';

@HiveType(typeId: 1)
class EmpResModel {
  @HiveField(0)
  int? _id;
  @HiveField(1)
  String? _name;
  @HiveField(2)
  String? _username;
  @HiveField(3)
  String? _email;
  Address? _address;
  @HiveField(4)
  String? _phone;
  @HiveField(5)
  String? _website;
  Company? _company;
  @HiveField(6)
  String? _companyString;
  @HiveField(7)
  String? _addressString;

  int? get id => _id;
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;
  Address? get address => _address;
  String? get phone => _phone;
  String? get website => _website;
  Company? get company => _company;
  String? get companystring => _companyString;
  String? get addressstring => _addressString;


  set companyString(String value) {
    _companyString = value;
  }

  EmpResModel({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
    String? companyString,
    String? addressString,

                    }){
    _id = id;
    _name = name;
    _username = username;
    _email = email;
    _address = address;
    _phone = phone;
    _website = website;
    _company = company;
    _companyString = companyString;
    _addressString = addressString;

  }

  EmpResModel.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _username = json["username"];
    _email = json["email"];
    _address = json["address"] != null ? Address.fromJson(json["address"]) : null;
    _phone = json["phone"];
    _website = json["website"];
    _company = json["company"] != null ? Company.fromJson(json["company"]) : null;
    _companyString = "";
    _addressString = "";
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["username"] = _username;
    map["email"] = _email;
    if (_address != null) {
      map["address"] = _address?.toJson();
    }
    map["phone"] = _phone;
    map["website"] = _website;
    if (_company != null) {
      map["company"] = _company?.toJson();
    }
    return map;
  }

  set addressString(String value) {
    _addressString = value;
  }
}

class Company {
  String? _name;
  String? _catchPhrase;
  String? _bs;

  String? get name => _name;
  String? get catchPhrase => _catchPhrase;
  String? get bs => _bs;

  Company({
    String? name,
    String? catchPhrase,
    String? bs}){
    _name = name;
    _catchPhrase = catchPhrase;
    _bs = bs;
  }

  Company.fromJson(dynamic json) {
    _name = json["name"];
    _catchPhrase = json["catchPhrase"];
    _bs = json["bs"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["catchPhrase"] = _catchPhrase;
    map["bs"] = _bs;
    return map;
  }

}

class Address {
  String? _street;
  String? _suite;
  String? _city;
  String? _zipcode;
  Geo? _geo;

  String? get street => _street;
  String? get suite => _suite;
  String? get city => _city;
  String? get zipcode => _zipcode;
  Geo? get geo => _geo;

  Address({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo}){
    _street = street;
    _suite = suite;
    _city = city;
    _zipcode = zipcode;
    _geo = geo;
  }

  Address.fromJson(dynamic json) {
    _street = json["street"];
    _suite = json["suite"];
    _city = json["city"];
    _zipcode = json["zipcode"];
    _geo = json["geo"] != null ? Geo.fromJson(json["geo"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["street"] = _street;
    map["suite"] = _suite;
    map["city"] = _city;
    map["zipcode"] = _zipcode;
    if (_geo != null) {
      map["geo"] = _geo?.toJson();
    }
    return map;
  }

}

class Geo {
  String? _lat;
  String? _lng;

  String? get lat => _lat;
  String? get lng => _lng;

  Geo({
    String? lat,
    String? lng}){
    _lat = lat;
    _lng = lng;
  }

  Geo.fromJson(dynamic json) {
    _lat = json["lat"];
    _lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lat"] = _lat;
    map["lng"] = _lng;
    return map;
  }

}