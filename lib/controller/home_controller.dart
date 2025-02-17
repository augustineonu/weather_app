import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  final String apiKey =
      '44bdb834a9f647aeb45203328251402'; // Replace with your API key
  final String baseUrl = 'http://api.weatherapi.com/v1/forecast.json';

  final weatherData = {}.obs;
  final isLoading = false.obs;
  final currentLocation = 'Jos'.obs;
  final hourlyForecast = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    isLoading.value = true;
    try {
      // Replace with your actual API key and endpoint
      final response = await http.get(Uri.parse(
          '$baseUrl?key=$apiKey&q=${currentLocation.value}&days=1&aqi=no'));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Weather data fetched successfully:: ${response.body}');
        }
        weatherData.value = json.decode(response.body);
        updateHourlyForecast();
      }
    } catch (e) {
      // Get.snackbar('Error', 'Failed to fetch weather data');

      throw Exception('Failed to load weather data');
    } finally {
      isLoading.value = false;
    }
  }

  void updateHourlyForecast() {
    if (weatherData.containsKey('forecast')) {
      hourlyForecast.value = List<Map<String, dynamic>>.from(
          weatherData['forecast']['forecastday'][0]['hour']);
    }
  }

  void updateLocation(String newLocation) {
    if (newLocation.isEmpty) return;
    currentLocation.value = newLocation;
    fetchWeatherData();
  }
}
