// ignore_for_file: camel_case_types, must_be_immutable

import 'package:ecommerce/ui/views/cartpage.dart';
import 'package:ecommerce/ui/views/mainpage.dart';
import 'package:ecommerce/ui/views/shoppage.dart';

import '../../data/models/classes/product.dart';
import '../../data/models/classes/user.dart';
import './signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class productDetails extends StatefulWidget {
  productClass product;
  userClass? user;

  productDetails({required this.product, this.user});

  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  var activebaritem = 0;
  ScrollController scrollhandle = ScrollController();
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    var productt = widget.product;
    var responsiveMedia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(title: Text(productt.title)),
      body: SingleChildScrollView(
        controller: scrollhandle,
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(productt.image), opacity: 0.15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: responsiveMedia * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.network(
                        productt.image,
                        height: 300,
                      ),
                    ),
                  ),
                ),
                Text(productt.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: responsiveMedia * 0.3,
                                child: Text("Load Description and Comments")),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    tapped = !tapped;
                                    if (tapped) {
                                      scrollhandle.animateTo(
                                          scrollhandle.position.maxScrollExtent,
                                          duration: Duration(milliseconds: 800),
                                          curve: Curves.easeInOut);
                                    } else {
                                      scrollhandle.animateTo(0,
                                          duration: Duration(milliseconds: 800),
                                          curve: Curves.easeInOut);
                                    }
                                  });
                                },
                                icon: tapped
                                    ? Icon(Icons.arrow_drop_up, size: 40)
                                    : Icon(Icons.arrow_drop_down, size: 40)),
                          ]),
                      Container(
                          width: responsiveMedia * 0.5,
                          child: Column(
                            children: [
                              Text(
                                "${productt.price.toString()}\$",
                                style: TextStyle(fontSize: 20),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    if (widget.user == null) {
                                      print("Clicked and if null true");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => signIn(),
                                          ));
                                    } else {
                                      //Dio().post('https://fakestoreapi.com/carts',data:
                                      //{

                                      //});
                                    }
                                  },
                                  child: Text(
                                    "Add to Cart Now",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ],
                          ))
                    ],
                  ),
                ),
                tapped
                    ? Container(
                        width: responsiveMedia,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Text(
                          productt.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )).animate().fade()
                    : Container(
                        height: 200,
                      )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            mainPage(user: widget.user ?? null)));
              },
              icon: Icon(Icons.home, color: Colors.black),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              shopPage(user: widget.user ?? null)));
                },
                icon: Icon(Icons.shop, color: Colors.orange),
              ),
              label: "Shop"),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              cartPage(user: widget.user ?? null)));
                },
                icon: Icon(Icons.shopping_bag, color: Colors.black),
              ),
              label: "Bag"),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              signIn(user: widget.user ?? null)));
                },
                icon: Icon(Icons.person, color: Colors.black),
              ),
              label: "Profile")
        ],
        fixedColor: Colors.black,
        selectedFontSize: 13,
      ),
    );
  }
}
