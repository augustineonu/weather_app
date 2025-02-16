import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/home_controller.dart';
import 'package:weather_app/widgets/animated_icon_widget.dart';
import 'package:weather_app/widgets/hourly_widgets.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue[700]!, Colors.blue[300]!],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search location...',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onSubmitted: controller.updateLocation,
                        ),
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: controller.fetchWeatherData,
                          child: ListView(
                            padding: const EdgeInsets.all(16.0),
                            children: [
                              Text(
                                controller.currentLocation.value,
                                style: const TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              if (controller.weatherData.isNotEmpty) ...[
                                AnimatedWeatherIcon(
                                  condition: controller.weatherData['current']
                                          ['condition']['text'] ??
                                      'sunny',
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '${controller.weatherData['current']['temp_c']}°C',
                                  style: const TextStyle(
                                    fontSize: 48,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 40),
                                const Text(
                                  'Hourly Forecast',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 70),
                                HourlyForecastGraph(
                                  hourlyData: controller.hourlyForecast,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
