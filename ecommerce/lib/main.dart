import 'package:ecommerce/ui/cubits/cartpagecubit.dart';
import 'package:ecommerce/ui/cubits/shoppagecubit.dart';
import 'package:ecommerce/ui/cubits/signincubit.dart';

import './ui/cubits/signupcubit.dart';
import './ui/views/mainpage.dart';
import './ui/cubits/mainpagecubit.dart';
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
      providers: [
        BlocProvider(create: (context) => signUpCubit()),
        BlocProvider(create: (context) => mainPageCubit()),
        BlocProvider(
          create: (context) => shopPageCubit(),
        ),
        BlocProvider(
          create: (context) => signinCubit(),
        ),
        BlocProvider(
          create: (context) => cartpageCubit(),
        )
      ],
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
