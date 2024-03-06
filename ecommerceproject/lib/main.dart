import 'package:ecommerceproject/ui/cubits/mainpagecubit.dart';
import 'package:ecommerceproject/ui/views/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => mainPageCubit(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eCommerce',
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: mainPage(),
      ),
    );
  }
}

