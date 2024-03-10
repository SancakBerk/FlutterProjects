// ignore_for_file: prefer_const_constructors, camel_case_types
import 'dart:ffi';

import 'package:ecommerce/data/models/classes/user.dart';
import 'package:ecommerce/ui/cubits/signincubit.dart';
import 'package:ecommerce/ui/views/cartpage.dart';
import 'package:ecommerce/ui/views/fotgotpassword.dart';
import 'package:ecommerce/ui/views/mainpage.dart';
import 'package:ecommerce/ui/views/shoppage.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './signup.dart';
import 'package:flutter/material.dart';

class signIn extends StatefulWidget {
  userClass? user;
  signIn({this.user});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  bool showPassword = false;
  var tfUsernameController = TextEditingController();
  var tfPasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    userClass userLogin;

    return Scaffold(
      appBar: widget.user != null
          ? AppBar(
              title: Text("Profile"),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signIn(
                              user: null,
                            ),
                          ));
                    },
                    child: Text(
                      "Log out",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                )
              ],
            )
          : AppBar(),
      body: widget.user != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      border:
                          Border.symmetric(horizontal: BorderSide(width: 1))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Email:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Text(widget.user!.email),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      border:
                          Border.symmetric(horizontal: BorderSide(width: 1))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Username:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Text(widget.user!.username),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      border:
                          Border.symmetric(horizontal: BorderSide(width: 1))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Password:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 115,
                      ),
                      GestureDetector(
                        child: Text(
                          showPassword ? widget.user!.password : "Click to see",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      border:
                          Border.symmetric(horizontal: BorderSide(width: 1))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Name Surname:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 65,
                      ),
                      Text(
                          "${widget.user!.name.firstname} ${widget.user!.name.lastname}"),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      border:
                          Border.symmetric(horizontal: BorderSide(width: 1))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Adress:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 143,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("City: ${widget.user!.address.city}"),
                          Text("Street: ${widget.user!.address.street}"),
                          Text("Number: ${widget.user!.address.number}"),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          : SingleChildScrollView(
              child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Login",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      controller: tfUsernameController,
                      decoration: InputDecoration(
                        label: Text("Username"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  TextField(
                    controller: tfPasswordcontroller,
                    decoration: InputDecoration(
                        label: Text("Password"), border: OutlineInputBorder()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signUp(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Don't you have an account?"),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        userLogin = await context.read<signinCubit>().userLogin(
                            tfUsernameController.text,
                            tfPasswordcontroller.text);
                        if (userLogin.id == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Wrong information"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => signIn(
                                  user: userLogin,
                                ),
                              ));
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 205, 57, 55),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: Column(
                        children: [
                          Text("Or Login With social account"),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.golf_course)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.golf_course))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
                icon: Icon(Icons.person, color: Colors.orange),
              ),
              label: "Profile")
        ],
        fixedColor: Colors.black,
        selectedFontSize: 13,
      ),
    );
  }
}
