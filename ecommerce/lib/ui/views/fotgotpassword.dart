import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.network(
        "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExNWZrMDU3dWNsZGU2cGQ1aHMxYXI4NGdweG1qZ2N0Z3Q4ZTkzb3l3YSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ivxGKTohku5UgkTZm7/giphy.gif",
        width: 400,
        height: 600,
      ).animate(delay: Duration(milliseconds: 2000)),
    ));
  }
}
