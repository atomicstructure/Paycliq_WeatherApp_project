import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
      child: Text('Weather goes in here'),
    ),
    );
  }
}