// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:ecommerce/data/models/classes/product.dart';
import 'package:ecommerce/data/models/classes/user.dart';
import 'package:ecommerce/data/models/renkler/renk.dart';
import 'package:ecommerce/ui/cubits/shoppagecubit.dart';
import 'package:ecommerce/ui/views/cartpage.dart';
import 'package:ecommerce/ui/views/mainpage.dart';
import 'package:ecommerce/ui/views/productdetail.dart';
import 'package:ecommerce/ui/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class shopPage extends StatefulWidget {
  userClass? user;

  shopPage({this.user});
  @override
  State<shopPage> createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      context.read<shopPageCubit>().getProducts();
    });

    super.initState();
  }

  var activebaritem = 1;
  @override
  Widget build(BuildContext context) {
    var responsiveWidController = MediaQuery.sizeOf(context).width;
    var responsiveHeightController = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buy now",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        setState(() {
                          context.read<shopPageCubit>().getProducts();
                        });
                      },
                      child: Text(
                        "All",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    FutureBuilder(
                      future: context.read<shopPageCubit>().getcategories(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var categoryList = snapshot.data!.map((categorie) {
                            return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black),
                                  onPressed: () {
                                    setState(() {
                                      context
                                          .read<shopPageCubit>()
                                          .getProductsByCategory(categorie);
                                    });
                                  },
                                  child: Text(
                                    categorie,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ));
                          }).toList();

                          return Row(
                            children: categoryList,
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<shopPageCubit, List<productClass>>(
                builder: (context, listProductclass) {
                  return GridView.builder(
                    itemCount: listProductclass.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 2,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      var product = listProductclass[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => productDetails(
                                        product: product,
                                        user: widget.user ?? null,
                                      )));
                        },
                        child: Container(
                            height: 350,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: mainPageTextLightGrey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  height: 200,
                                  product.image,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  product.category,
                                  style:
                                      TextStyle(color: mainPageTextLightGrey),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 60,
                                  child: Text(
                                    product.title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  "${product.price.toString()}\$",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 17),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${product.rating.rate}",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color.fromARGB(
                                                  255, 176, 165, 62),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "(${product.rating.count.toString()})",
                                          style: TextStyle(
                                              color: mainPageTextLightGrey),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                  );
                },
              ),
            )
          ],
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
            icon: IconButton(
              onPressed: () {
                setState(() {
                  activebaritem = 0;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            mainPage(user: widget.user ?? null)));
              },
              icon: Icon(Icons.home,
                  color: activebaritem == 0 ? Colors.orange : Colors.black),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  setState(() {
                    activebaritem = 1;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              shopPage(user: widget.user ?? null)));
                },
                icon: Icon(Icons.shop,
                    color: activebaritem == 1 ? Colors.orange : Colors.black),
              ),
              label: "Shop"),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  setState(() {
                    activebaritem = 2;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              cartPage(user: widget.user ?? null)));
                },
                icon: Icon(Icons.access_time,
                    color: activebaritem == 2 ? Colors.orange : Colors.black),
              ),
              label: "Bag"),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  setState(() {
                    activebaritem = 3;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              signIn(user: widget.user ?? null)));
                },
                icon: Icon(Icons.person,
                    color: activebaritem == 3 ? Colors.orange : Colors.black),
              ),
              label: "Profile")
        ],
        fixedColor: Colors.black,
        selectedFontSize: 13,
      ),
    );
  }
}
