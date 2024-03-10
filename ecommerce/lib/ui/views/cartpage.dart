// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:ecommerce/data/models/classes/product.dart';
import 'package:ecommerce/data/models/classes/user.dart';
import 'package:ecommerce/data/models/classes/usercart.dart';
import 'package:ecommerce/data/models/renkler/renk.dart';
import 'package:ecommerce/ui/cubits/cartpagecubit.dart';
import 'package:ecommerce/ui/views/mainpage.dart';
import 'package:ecommerce/ui/views/shoppage.dart';
import 'package:ecommerce/ui/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cartPage extends StatefulWidget {
  userClass? user;

  cartPage({this.user});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  @override
  void initState() {
    if (widget.user != null) {
      print("if'e girdi");
      context.read<cartpageCubit>().getcartbyUserid(widget.user!.id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var responsiveWidth = MediaQuery.sizeOf(context).width;
    var responsiveHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Bag"),
        centerTitle: true,
      ),
      body: widget.user != null
          ? SingleChildScrollView(
              child: Container(
                height: responsiveHeight,
                width: responsiveWidth,
                child: Column(
                  children: [
                    BlocBuilder<cartpageCubit, List<productClass>>(
                      builder: (context, state) {
                        if (state.isNotEmpty && state.isNotEmpty) {
                          return Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                height: 550,
                                child: ListView.builder(
                                  itemCount: state.length,
                                  itemBuilder: (context, index) {
                                    var product = state[index];
                                    return Padding(
                                      padding: EdgeInsets.symmetric(),
                                      child: Container(
                                          height: 300,
                                          child: Row(
                                            children: [
                                              Image.network(
                                                product.image,
                                                height: 250,
                                                width: 200,
                                                fit: BoxFit.contain,
                                              ),
                                              SizedBox(
                                                  width: 120,
                                                  height: 250,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0,
                                                            vertical: 30),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          product.category,
                                                          style: TextStyle(
                                                              color:
                                                                  mainPageTextLightGrey),
                                                        ),
                                                        Text(
                                                          product.title,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                            "${product.price.toString()} \$"),
                                                      ],
                                                    ),
                                                  )),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(Icons.clear)),
                                                  Row(
                                                    children: [
                                                      Text(product.rating.rate
                                                          .toString()),
                                                      Icon(Icons.star)
                                                    ],
                                                  ),
                                                  Text(
                                                    product.rating.count
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            mainPageTextLightGrey),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                    );
                                  },
                                ),
                              ));
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Login for your bag .....",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                ),
                Image.network(
                  "https://i.pinimg.com/originals/99/63/3a/99633a3fbb46dbff0addaefff7804cc5.gif",
                )
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
                icon: Icon(Icons.shop, color: Colors.black),
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
                icon: Icon(Icons.shopping_bag, color: Colors.orange),
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
