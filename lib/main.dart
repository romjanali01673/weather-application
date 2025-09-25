import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:weather_application/presentation/home/controller/c_home.dart';
import 'package:weather_application/presentation/home/view/s_home.dart';

void main() {
  
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SHome()
    );
  }
}
