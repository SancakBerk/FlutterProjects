// ignore_for_file: camel_case_types, must_be_immutable
import 'package:ecommerce/ui/views/signin.dart';

import '../cubits/mainpagecubit.dart';
import '../../data/models/classes/product.dart';
import '../../data/models/classes/user.dart';
import '../../data/models/renkler/renk.dart';

import './cartpage.dart';
import './productdetail.dart';
import './shoppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class mainPage extends StatefulWidget {
  userClass? user;

  mainPage({this.user});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  ScrollController scrollHandle = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<mainPageCubit>().loadLimitResult();
  }

  @override
  Widget build(BuildContext context) {
    var responsiveWidth = MediaQuery.sizeOf(context).width;
    if (widget.user != null) {
      print("WİDGET USER NULL DEĞİL ${widget.user!.name.firstname}");
    }

    return Scaffold(
      appBar: widget.user != null
          ? AppBar(
              title: Text(
                "Welcome ${widget.user!.name.firstname}...",
                style: TextStyle(color: Colors.black),
              ),
            )
          : null,
      backgroundColor: mainPageBackgroundColor,
      body: SingleChildScrollView(
        controller: scrollHandle,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                alignment: Alignment.bottomLeft,
                width: responsiveWidth,
                height: 500,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("statics/Image.png"),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 200,
                          child: const Text(
                            "Fashion Sale",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 50),
                          )).animate().fadeIn(duration: 1000.ms).slideX(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => shopPage(),
                              ));
                        },
                        child: Text(
                          "Check",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size(200, 50)),
                      ).animate(delay: 2000.ms).shake()
                    ],
                  ),
                )),
            Container(
              height: 400,
              width: responsiveWidth,
              decoration: BoxDecoration(color: Colors.white),
              child: BlocBuilder<mainPageCubit, List<productClass>>(
                  builder: (context, state) {
                if (state.isNotEmpty) {
                  return Column(
                    children: [
                      Container(
                        height: 100,
                        width: responsiveWidth,
                        child: Row(
                          children: [
                            Container(
                              width: responsiveWidth * 1 / 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "NEW",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 30),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "You've never seen it before",
                                      style: TextStyle(
                                          color: mainPageTextLightGrey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: responsiveWidth * 0.5,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => shopPage(
                                            user: widget.user ?? null,
                                          ),
                                        ));
                                  },
                                  child: const Text(
                                    "View all",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: responsiveWidth,
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => productDetails(
                                          product: state[index],
                                          user: widget.user ?? null,
                                        ),
                                      )).then((value) {
                                    scrollHandle.animateTo(0,
                                        duration: Duration(milliseconds: 1000),
                                        curve: Curves.easeInOut);
                                  });
                                },
                                child: Container(
                                    width: 200,
                                    height: 300,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image.network(
                                              state[index].image,
                                              height: 180,
                                            ),
                                          ),
                                          Flexible(
                                              child: Text(state[index].title,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  textAlign: TextAlign.center)),
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              icon: Icon(Icons.home, color: Colors.orange),
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
