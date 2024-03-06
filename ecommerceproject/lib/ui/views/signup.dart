import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
          child: Column(
            children: [
              Container(
                height: 100,
                alignment: Alignment.centerLeft,
                child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Row(
                        children: [
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(hintText: "Email",border: OutlineInputBorder(),fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(width: 40),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(hintText: "Username",border: OutlineInputBorder()),
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Row(
                        children: [
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(hintText: "Password",border: OutlineInputBorder(),fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(width: 40),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(hintText: "Name Surname",border: OutlineInputBorder()),
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),


                    SizedBox(
                        width: 200 ,child: TextField(decoration: InputDecoration(hintText: "Phone",border: OutlineInputBorder()),)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Already Have an acoount?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 400,
                        height: 200,
                        child: FlutterLocationPicker(
                          searchBarHintText: "Find your address",
                            initPosition: LatLong(39, 30),
                            selectLocationButtonStyle: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.grey),
                            ),
                            selectedLocationButtonTextstyle: const TextStyle(fontSize: 18),
                            selectLocationButtonText: 'Set Current Location',
                            selectLocationButtonLeadingIcon: const Icon(Icons.check),
                            initZoom: 10,
                            minZoomLevel: 5,
                            maxZoomLevel: 16,
                            trackMyPosition: true,
                            onError: (e) => print(e),
                            onPicked: (pickedData) {
                              print(pickedData.latLong.latitude);
                              print(pickedData.latLong.longitude);
                              print(pickedData.address);
                              print(pickedData.addressData['country']);
                            },
                            onChanged: (pickedData) {
                              print(pickedData.latLong.latitude);
                              print(pickedData.latLong.longitude);
                              print(pickedData.address);
                              print(pickedData.addressData);
                            })
                      ),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Sign Up")),
                  ],
                ),

              ),


              Container(
                child: Column(
                  children: [
                    Text("Or sign up with social account"),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.golf_course)),
                          ),
                          Container(
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.golf_course)),
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
      ),
    );
  }
}
