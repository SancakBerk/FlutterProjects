// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _inputcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextField(
        controller: _inputcontroller,
      ),
    );
  }
}
