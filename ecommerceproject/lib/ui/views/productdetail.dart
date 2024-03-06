import 'package:dio/dio.dart';
import 'package:ecommerceproject/data/models/classes/product.dart';
import 'package:ecommerceproject/data/models/classes/user.dart';
import 'package:ecommerceproject/ui/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class productDetails extends StatefulWidget {
  productClass product;
  userClass? userdata;


  productDetails({required this.product,this.userdata});

  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  var activebaritem =0;
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
                      child: Image.network(productt.image),
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
                                    if(tapped)
                                    {
                                      scrollhandle.animateTo(
                                          scrollhandle.position.maxScrollExtent,
                                          duration: Duration(milliseconds: 800),
                                          curve: Curves.easeInOut);
                                    }
                                    else
                                    {
                                      scrollhandle.animateTo(0, duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
                                    }
                                  });
                                },
                                icon: Icon(Icons.arrow_drop_down, size: 40)),
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
                                    if(widget.userdata == null)
                                    {
                                      print("Clicked and if null true");
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => signIn(),));
                                    }
                                    else
                                    {
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
        currentIndex: activebaritem,
        onTap: (value) {
          setState(() {
            activebaritem = value;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: activebaritem == 0 ? Colors.orange : Colors.black),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop,
                  color: activebaritem == 1 ? Colors.orange : Colors.black),
              label: "Shop"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time,
                  color: activebaritem == 2 ? Colors.orange : Colors.black),
              label: "Bag"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: activebaritem == 3 ? Colors.orange : Colors.black),
              label: "Profile")
        ],
        fixedColor: Colors.black,
        selectedFontSize: 13,
      ),
    );
  }
}
