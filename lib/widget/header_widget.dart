import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
String city = '';
String date = DateFormat('yMMMd').format(DateTime.now(),);

final GlobalController globalController = Get.put(GlobalController(), permanent: true);


@override
  void initState() {
    getAddress(globalController.getLat().value, globalController.getLng().value,);
    super.initState();
  }

  getAddress(lat, lng) async{
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lng);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: TextStyle(fontSize: 34, height: 2,
            color: Theme.of(context).colorScheme.onBackground
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
              height: 1.5
              ),
          ),
        )
      ],
    );
  }
}