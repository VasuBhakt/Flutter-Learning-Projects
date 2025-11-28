import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/cards/additional_info_card.dart';
import 'package:weather_app/cards/hourly_weather_card.dart';
import 'package:weather_app/cards/today_weather_card.dart';

/*class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => 
       _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}*/

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WeatherApp",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          /*(
          child: Icon(Icons.refresh),
          onTap: () {
            print("refresh");
          },),*/
          IconButton(
            onPressed: () {
              print("Refresh");
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Main Card
            TodayWeatherCard(weather: "Rain", temperature: 300),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Weather Forecast",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            // weather forecast cards
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyWeatherCard(time : "09:00", temperature: 320,),
                  HourlyWeatherCard(time : "12:00",temperature: 340,),
                  HourlyWeatherCard(time : "15:00", temperature: 320,),
                  HourlyWeatherCard(time : "18:00",temperature: 340,),
                  HourlyWeatherCard(time : "21:00", temperature: 320,),
                  HourlyWeatherCard(time : "00:00",temperature: 340,),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // weather forecast cards
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Additional Information",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdditionalInfoCard(attribute: "Humidity", value: 24),
                  AdditionalInfoCard(attribute: "Wind Speed", value: 24),
                  AdditionalInfoCard(attribute: "Visibility", value: 2.8),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
