import 'package:dio/dio.dart';
import 'package:ecommerce/data/models/classes/user.dart';
import 'package:ecommerce/data/models/classes/usercart.dart';
import 'package:flutter/material.dart';
import '../models/classes/product.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class eCommerceRepo {
  Future<List<productClass>> loadLimitResultRepo() async {
    try {
      var result = await Dio().get('https://fakestoreapi.com/products?limit=5');
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(result.data);
      return (decodeProductJson(list));
    } catch (err) {
      print("HATAAA $err");
      return ([]);
    }
  }

  List<productClass> decodeProductJson(List<Map<String, dynamic>> jsonVeri) {
    List<productClass> products =
        jsonVeri.map((e) => productClass.fromJson(e)).toList();
    return products;
  }

  userClass decodUserJson(Map<String, dynamic> jsonveri, int id) {
    print("BURADA HATA VAR MI");
    userClass user = userClass.fromJson(jsonveri, id);
    print("VERİLERİ KONTROL ET");
    print(user.name.firstname);
    print(user.name.lastname);
    print(user.email);
    print(user.id);
    print(user.password);
    print(user.phone);

    return user;
  }

  Future<userClass> addUserandreturn(name, surname, username, phone, password,
      mail, latitude, longitude, city, street, postcode, number) async {
    try {
      var responseuser =
          await Dio().post("https://fakestoreapi.com/users", data: {
        "email": mail,
        "username": username,
        "password": password,
        "name": {"firstname": name, "lastname": surname},
        "address": {
          "city": "",
          "street": "",
          "number": 3,
          "zipcode": "",
          "geolocation": {
            "lat": "",
            "long": "",
          }
        },
        "phone": ""
      });
      var myresponsedata = responseuser.data;
      String idValue = myresponsedata["id"].toString();
      return getUserById(idValue);
    } catch (e) {
      print("Fİrst catch");
      print(e);
      return userClass(
          id: 0,
          email: "",
          username: "",
          password: "",
          name: nameClass(firstname: "", lastname: ""),
          address: addressClass(
              geolocation: geoLocaitonClass(lat: "", long: ""),
              city: "",
              street: "",
              number: 5,
              zipcode: ""),
          phone: "");
    }
  }

  Future<List<productClass>> getProducts() async {
    var response = await Dio().get("https://fakestoreapi.com/products");
    List<Map<String, dynamic>> decodejson =
        List<Map<String, dynamic>>.from(response.data);
    return decodeProductJson(decodejson);
  }

  Future<List<productClass>> getProductsByCategory(String categorie) async {
    var response = await Dio()
        .get("https://fakestoreapi.com/products/category/$categorie");
    List<Map<String, dynamic>> Jsondata =
        List<Map<String, dynamic>>.from(response.data);
    return (decodeProductJson(Jsondata));
  }

  Future<userClass> userLogin(username, password) async {
    try {
      var response = await Dio().post("https://fakestoreapi.com/auth/login",
          data: {"username": username, "password": password});
      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(response.data["token"]);
      print(decodedToken["sub"].runtimeType);
      return getUserById(decodedToken["sub"].toString());
    } catch (e) {
      print("ERROR LOGİN $e");
      return userClass(
          id: 0,
          email: "",
          username: "",
          password: "",
          name: nameClass(firstname: "", lastname: ""),
          address: addressClass(
              geolocation: geoLocaitonClass(lat: "", long: ""),
              city: "",
              street: "",
              number: 0,
              zipcode: ""),
          phone: "");
    }
  }

  Future<userClass> getUserById(String id) async {
    try {
      var user = await Dio().get("https://fakestoreapi.com/users/$id");
      Map<String, dynamic> jsondata = Map<String, dynamic>.from(user.data);
      var deneme = decodUserJson(jsondata, int.parse(id));
      return deneme;
    } catch (e) {
      print("Second catch");
      return userClass(
          id: 0,
          email: "",
          username: "",
          password: "",
          name: nameClass(firstname: "", lastname: ""),
          address: addressClass(
              geolocation: geoLocaitonClass(lat: "", long: ""),
              city: "",
              street: "",
              number: 5,
              zipcode: ""),
          phone: "");
    }
  }

  Future<List<productClass>> getcartbyUserid(int id) async {
    try {
      var response = await Dio()
          .get("https://fakestoreapi.com/carts/user/${id.toString()}");

      print(response.data);
      print(response.data.runtimeType);
      userCartClass usercartObject = userCartClass.fromJson(response.data[0]);
      var products =
          await Future.wait(usercartObject.products.map((eachproduct) async {
        return await getSingleProductById(eachproduct.productId);
      }));

      return products;
    } catch (e) {
      print("ERROR $e");
      return [];
    }
  }

  Future<productClass> getSingleProductById(int id) async {
    try {
      var response =
          await Dio().get("https://fakestoreapi.com/products/${id.toString()}");
      print(response.data);
      return productClass.fromJson(response.data);
    } catch (e) {
      print("HATTAAAA$e");
      return productClass(
          id: 0,
          title: "",
          price: 0,
          category: "",
          description: "",
          image: "",
          rating: Rating(rate: 0, count: 0));
    }
  }
}
