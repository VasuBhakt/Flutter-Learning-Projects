import 'dart:ui';

import 'package:flutter/material.dart';

class HourlyWeatherCard extends StatelessWidget {
  final String time;
  final int temperature;
  const HourlyWeatherCard({
    super.key,
    required this.time,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        color: Color.fromARGB(255, 59, 64, 87),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(Icons.cloud, size: 32),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text("$temperature", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
