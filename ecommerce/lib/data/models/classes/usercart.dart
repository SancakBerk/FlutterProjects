import 'package:ecommerce/data/models/classes/product.dart';

class userCartClass {
  int id;
  int userId;
  String date;
  List<cartProductClass> products;

  userCartClass(
      {required this.id,
      required this.userId,
      required this.date,
      required this.products});

  factory userCartClass.fromJson(dynamic jsonveri) {
    return userCartClass(
      id: jsonveri["id"],
      userId: jsonveri["userId"],
      date: jsonveri["date"],
      products: (jsonveri["products"] as List<dynamic>).map((productJson) {
        return cartProductClass.fromJson(productJson as Map<String, dynamic>);
      }).toList(),
    );
  }
}

class cartProductClass {
  int productId;
  int quantity;
  cartProductClass({required this.productId, required this.quantity});

  factory cartProductClass.fromJson(json) {
    return cartProductClass(
        productId: json["productId"], quantity: json["quantity"]);
  }
}
