import 'dart:ui';

import 'package:flutter/material.dart';

class TodayWeatherCard extends StatelessWidget {
  final double temperature;
  final String weather;
  final String time;
  const TodayWeatherCard({
    super.key,
    required this.temperature,
    required this.weather,
    required this.time,
  });

  Icon _retIcon(String sky) {
    if (sky == "Rain") {
      return Icon(Icons.cloudy_snowing, size: 64);
    }
    if (sky == "Clouds") {
      return Icon(Icons.cloud, size: 64);
    }
    double hour = double.parse(time.split(":")[0]);
    if (hour >= 6 && hour <= 18) {
      if (sky == "Clear") {
        return Icon(Icons.wb_sunny, size: 64);
      } else {
        return Icon(Icons.foggy, size: 64);
      }
    }
    if (sky == "Clear") {
      return Icon(Icons.nights_stay, size: 64);
    } else {
      return Icon(Icons.foggy, size: 64);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 20,
        color: Color.fromARGB(255, 59, 64, 87),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "${temperature.toStringAsFixed(2)} C",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  _retIcon(weather),
                  SizedBox(height: 16),
                  Text(weather, style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
