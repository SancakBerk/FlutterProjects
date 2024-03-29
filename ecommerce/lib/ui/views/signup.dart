// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:ecommerce/data/models/classes/user.dart';
import 'package:ecommerce/data/models/renkler/renk.dart';
import 'package:ecommerce/ui/cubits/signupcubit.dart';
import 'package:ecommerce/ui/views/mainpage.dart';
import 'package:ecommerce/ui/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  var latitude;
  var longitude;
  var city;
  var street;
  var number;
  var postcode;

  var tfMailcontroller = TextEditingController();
  var tfUsername = TextEditingController();
  var tfPassword = TextEditingController();
  var tfName = TextEditingController();
  var tfSurname = TextEditingController();
  var tfPhone = TextEditingController();

  bool isMailEmpty = false;
  bool isUsernameEmpty = false;
  bool isNameEmpty = false;
  bool isSurnameEmpty = false;
  bool isPasswordEmpty = false;
  bool isPhoneEmpty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: const BoxDecoration(),
            child: Form(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: const Text(
                      "Sign up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 8),
                              Expanded(
                                  child: TextField(
                                controller: tfMailcontroller,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    errorText:
                                        isMailEmpty ? "Enter your Email" : null,
                                    border: OutlineInputBorder()),
                              )),
                              SizedBox(width: 40),
                              Expanded(
                                child: TextField(
                                  controller: tfUsername,
                                  decoration: InputDecoration(
                                      errorText: isUsernameEmpty
                                          ? "Enter your Username"
                                          : null,
                                      hintText: "Username",
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  controller: tfName,
                                  decoration: InputDecoration(
                                      hintText: "Name",
                                      errorText: isNameEmpty
                                          ? "Enter your Name"
                                          : null,
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white),
                                ),
                              ),
                              SizedBox(width: 40),
                              Expanded(
                                child: TextField(
                                  controller: tfSurname,
                                  decoration: InputDecoration(
                                      errorText: isSurnameEmpty
                                          ? "Enter your Surname"
                                          : null,
                                      hintText: "Surname",
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: tfPassword,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      errorText: isPasswordEmpty
                                          ? "Enter your Password"
                                          : null,
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white),
                                ),
                              ),
                              SizedBox(width: 40),
                              Expanded(
                                child: TextField(
                                  controller: tfPhone,
                                  decoration: InputDecoration(
                                      errorText: isPhoneEmpty
                                          ? "Enter your Phone"
                                          : null,
                                      hintText: "Phone",
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => signIn(),
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Already Have an acoount?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: mainPageTextLightGrey),
                                ),
                                Icon(Icons.arrow_right),
                              ],
                            ),
                          ),
                        ) /*Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                              width: 400,
                              height: 200,
                              child: FlutterLocationPicker(
                                  showSearchBar: true,
                                  searchBarHintText: "Find your address",
                                  initPosition: const LatLong(39, 30),
                                  selectLocationButtonStyle: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.grey),
                                  ),
                                  selectedLocationButtonTextstyle:
                                      const TextStyle(fontSize: 18),
                                  selectLocationButtonText:
                                      'Set Current Location',
                                  selectLocationButtonLeadingIcon:
                                      const Icon(Icons.check),
                                  initZoom: 10,
                                  minZoomLevel: 5,
                                  maxZoomLevel: 16,
                                  trackMyPosition: true,
                                  onError: (e) =>
                                      print("ERRORRRRR HATTAAAA $e"),
                                  onPicked: (pickedData) {
                                    latitude = pickedData.latLong.latitude;
                                    longitude = pickedData.latLong.longitude;
                                    city = pickedData.addressData["city"];
                                    street = pickedData.addressData["street"];
                                    postcode =
                                        pickedData.addressData["postscode"];
                                    number =
                                        pickedData.addressData["house_number"];
                                  },
                                  onChanged: (pickedData) {})),
                        ),*/
                        ,
                        ElevatedButton(
                          onPressed: () async {
                            userClass newuser = await context
                                .read<signUpCubit>()
                                .addUserandreturn(
                                    tfName.text,
                                    tfSurname.text,
                                    tfUsername.text,
                                    tfPhone.text,
                                    tfPassword.text,
                                    tfMailcontroller.text,
                                    "latitude",
                                    "longitude",
                                    "city",
                                    "street",
                                    "postcode",
                                    "5");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => mainPage(
                                    user: newuser,
                                  ),
                                ));
                            /*if (tfName.text.isNotEmpty &&
                                  tfSurname.text.isNotEmpty &&
                                  tfUsername.text.isNotEmpty &&
                                  tfPhone.text.isNotEmpty &&
                                  tfPassword.text.isNotEmpty &&
                                  tfMailcontroller.text.isNotEmpty) {
                                userClass newuser = await context
                                    .read<signUpCubit>()
                                    .addUserandreturn(
                                        tfName.text,
                                        tfSurname.text,
                                        tfUsername.text,
                                        tfPhone.text,
                                        tfPassword.text,
                                        tfMailcontroller.text,
                                        latitude,
                                        longitude,
                                        city,
                                        street,
                                        postcode,
                                        number);
                                print("NEwuserinfo");
                                print("tf.phone${tfPhone.text}");
                                print(newuser.name.firstname);
                                print(newuser.name.lastname);
                                print(newuser.id);
                                print(
                                    "$latitude $longitude $city$street $postcode$number");

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => mainPage(
                                        user: newuser,
                                      ),
                                    ));
                              } else {
                                if (tfName.text.isEmpty) {
                                  setState(() {
                                    isNameEmpty = true;
                                  });
                                } else {
                                  setState(() {
                                    isNameEmpty = false;
                                  });
                                }
                                if (tfSurname.text.isEmpty) {
                                  setState(() {
                                    isSurnameEmpty = true;
                                  });
                                }
                                setState(() {
                                  isSurnameEmpty = false;
                                });
                                if (tfUsername.text.isEmpty) {
                                  setState(() {
                                    isUsernameEmpty = true;
                                  });
                                } else {
                                  setState(() {
                                    isUsernameEmpty = false;
                                  });
                                }
                                if (tfPhone.text.isEmpty) {
                                  setState(() {
                                    isPhoneEmpty = true;
                                  });
                                } else {
                                  setState(() {
                                    isPhoneEmpty = false;
                                  });
                                }
                                if (tfPassword.text.isEmpty) {
                                  setState(() {
                                    isPasswordEmpty = true;
                                  });
                                } else {
                                  setState(() {
                                    isPasswordEmpty = false;
                                  });
                                }
                                if (tfMailcontroller.text.isEmpty) {
                                  setState(() {
                                    isMailEmpty = true;
                                  });
                                } else {
                                  setState(() {
                                    isMailEmpty = false;
                                  });
                                }
                              }*/
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Text("Or sign up with social account"),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.golf_course)),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.golf_course)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
