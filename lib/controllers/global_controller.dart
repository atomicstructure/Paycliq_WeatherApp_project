import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/api/fetch_weather.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';

class GlobalController extends GetxController{
final RxBool _isLoading = true.obs;
final RxDouble _lat = 0.0.obs;
final RxDouble _lng = 0.0.obs;

// TODO: Create Intances for them to be called

RxBool checkLoading() => _isLoading;
RxDouble getLat() => _lat;
RxDouble getLng() => _lng;

final weatherData = WeatherData().obs;

@override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }


  getLocation() async{
    LocationPermission locationPermission;
    bool isServiceEnabled;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error('Location not enabled, please turn on Location');
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return  Future.error('Location permission denied. Please allow location services');
    }else if (locationPermission == LocationPermission.denied) {

      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location Permission denied');
      }
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) {
      _lat.value = value.latitude;
      _lng.value = value.longitude;



      return FetchWeatherAPI()
      .processData(value.latitude, value.longitude)
      .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }
}