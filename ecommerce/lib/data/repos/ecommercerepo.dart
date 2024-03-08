import 'package:dio/dio.dart';
import 'package:ecommerce/data/models/classes/user.dart';

import '../models/classes/product.dart';

class eCommerceRepo {
  Future<List<productClass>> loadLimitResultRepo() async {
    try {
      var result = await Dio().get('https://fakestoreapi.com/products?limit=5');
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(result.data);
      return (decodeJson(list));
    } catch (err) {
      print("HATAAA $err");
      return ([]);
    }
  }

  List<productClass> decodeJson(List<Map<String, dynamic>> jsonVeri) {
    List<productClass> products =
        jsonVeri.map((e) => productClass.fromJson(e)).toList();
    return products;
  }

  userClass decodUserJson(Map<String, dynamic> jsonveri) {
    userClass user = userClass.fromJson(jsonveri);
    return user;
  }

  Future<userClass> addUserandreturn(name, surname, username, phone, password,
      mail, latitude, longitude, city, street, postcode, number) async {
    try {
      var responseuser =
          await Dio().post("https://fakestoreapi.com/users", data: {
        {
          "email": mail,
          "username": username,
          "password": password,
          "name": {"firstname": name, "lastname": surname},
          "address": {
            "city": city,
            "street": street,
            "number": number,
            "zipcode": postcode,
            "geolocation": {
              "lat": latitude,
              "long": longitude,
            }
          },
          "phone": phone
        }
      });

      try {
        var user = await Dio()
            .get("https://fakestoreapi.com/users/${responseuser.data["id"]}");
        Map<String, dynamic> jsondata = Map<String, dynamic>.from(user.data);
        return decodUserJson(jsondata);
      } catch (e) {
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
                number: "",
                zipcode: ""),
            phone: "");
      }
    } catch (e) {
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
              number: "",
              zipcode: ""),
          phone: "");
    }
  }
}
