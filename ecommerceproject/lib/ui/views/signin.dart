import 'package:ecommerceproject/ui/views/signup.dart';
import 'package:flutter/material.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ElevatedButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => signUp(),));
      }, child: Text("signup")),

    );
  }
}
