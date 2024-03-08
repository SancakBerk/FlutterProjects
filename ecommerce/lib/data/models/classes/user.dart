import 'dart:convert';
import 'package:flutter/foundation.dart';

class userClass {
  int id;
  String email;
  String username;
  String password;
  nameClass name;
  addressClass address;
  String phone;

  userClass(
      {required this.id,
      required this.email,
      required this.username,
      required this.password,
      required this.name,
      required this.address,
      required this.phone});

  factory userClass.fromJson(Map<String, dynamic> jsonveri) {
    print("JSON VERİ $jsonveri");

    return userClass(
        id: 1,
        address: addressClass.fromJson(jsonveri["address"]),
        email: jsonveri["email"],
        username: jsonveri["username"],
        password: jsonveri["password"],
        name: nameClass.fromJson(jsonveri["name"]),
        phone: jsonveri["phone"]);
  }
}

class nameClass {
  String firstname;
  String lastname;

  nameClass({required this.firstname, required this.lastname});
  factory nameClass.fromJson(Map<String, dynamic> namemap) {
    return nameClass(
        firstname: namemap["firstname"], lastname: namemap["lastname"]);
  }
}

class addressClass {
  geoLocaitonClass geolocation;
  String city;
  String street;
  String number;
  String zipcode;
  addressClass(
      {required this.geolocation,
      required this.city,
      required this.street,
      required this.number,
      required this.zipcode});

  factory addressClass.fromJson(Map<String, dynamic> addresmap) {
    return addressClass(
        geolocation: geoLocaitonClass.fromJson(addresmap["geolocation"]),
        city: addresmap["city"],
        street: addresmap["street"],
        number: addresmap["number"],
        zipcode: addresmap["zipcode"]);
  }
}

class geoLocaitonClass {
  String lat;
  String long;
  geoLocaitonClass({required this.lat, required this.long});

  factory geoLocaitonClass.fromJson(Map<String, dynamic> geolLocMap) {
    return geoLocaitonClass(lat: geolLocMap["lat"], long: geolLocMap["long"]);
  }
}
