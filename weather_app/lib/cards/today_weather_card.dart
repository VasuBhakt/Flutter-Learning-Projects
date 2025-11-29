import 'dart:ui';

import 'package:flutter/material.dart';

class TodayWeatherCard extends StatelessWidget {
  final int temperature;
  final String weather;
  const TodayWeatherCard({
    super.key,
    required this.temperature,
    required this.weather,
  });

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
                    "$temperature F",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Icon(Icons.cloud, size: 64),
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
