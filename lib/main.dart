import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:weatherapp_starter_project/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PayWeather',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 238, 39, 73),),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      );
      
  }
}
