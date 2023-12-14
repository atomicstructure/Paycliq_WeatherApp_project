import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/widget/header_widget.dart';
// import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading()
        .isTrue ? const Center(
          child: CircularProgressIndicator(),
        )
        : ListView(
          scrollDirection: Axis.vertical,
          children: const [
            SizedBox(height: 16,),
            HeaderWidget()
          ],
        )
      )
    ),
  );
}
}