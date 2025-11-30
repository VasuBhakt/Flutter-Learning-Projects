import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/cards/additional_info_card.dart';
import 'package:weather_app/cards/hourly_weather_card.dart';
import 'package:weather_app/cards/today_weather_card.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';
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

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'Kolkata';
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApiKey',
        ),
      );
      final data = jsonDecode(response.body);
      if(data['cod']!='200') {
        throw 'An unexpected error occured';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

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
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          //print(snapshot);
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if(snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data!;
          final currentWeatherData = data['list'][0];
          final currentTemp = currentWeatherData['main']['temp'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final currentHumidity = currentWeatherData['main']['humidity'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];
          final currentFeelsLike = currentWeatherData['main']['feels_like'];
          return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Main Card
              TodayWeatherCard(weather: currentSky, temperature: currentTemp-273.16),
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
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
                    
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 165,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final hourlyForecast = data['list'][index+1];
                    final forecastTime = DateTime.parse(hourlyForecast['dt_txt']);

                    return HourlyWeatherCard(
                      time: DateFormat.Hm().format(forecastTime),
                      temperature: hourlyForecast['main']['temp'],
                      weather: hourlyForecast['weather'][0]['main'],
                    );
                  } ,
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
                    AdditionalInfoCard(
                      attribute: "Humidity",
                      value: currentHumidity.toDouble(),
                      icon: Icon(Icons.water_drop, size: 32,),
                    ),
                    AdditionalInfoCard(
                      attribute: "Wind Speed",
                      value: currentWindSpeed,
                      icon: Icon(Icons.air, size: 32,),
                    ),
                    AdditionalInfoCard(
                      attribute: "Feels Like",
                      value: currentFeelsLike-273.16,
                      icon: Icon(Icons.thermostat, size: 32,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        },
      ),
    );
  }
}
