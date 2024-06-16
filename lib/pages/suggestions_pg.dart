// ignore_for_file: unused_local_variable, depend_on_referenced_packages, prefer_const_constructors
import 'dart:convert';
import 'package:deja_brew/models/item.dart';
import 'package:deja_brew/pages/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:deja_brew/utils.dart';

class SuggestionsPg extends StatefulWidget {
  const SuggestionsPg({Key? key}) : super(key: key);
  @override
  State<SuggestionsPg> createState() => _SuggestionsPg();
}

class _SuggestionsPg extends State<SuggestionsPg> {
  String temperature = '';
  String forecast = '';
  String weatherText = '';
  double latitude = 0.0;
  double longitude = 0.0;
  List _suggestions = [];

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    try {
      Position userLocation = await getUserLocation();
      setState(() {
        latitude = userLocation.latitude;
        longitude = userLocation.longitude;
      });

      Uri uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=e3286c439c2ecf08e9e43c44da0cbe19');
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        setState(() {
          double kelvinTemp =
              double.parse(decodedData["main"]["temp"].toString());
          double tempCelsius = _convertTemp(kelvinTemp);
          temperature = tempCelsius
              .toStringAsFixed(2); // Display temperature with 2 decimal places
          forecast = decodedData["weather"][0]["description"];
          // Update weather message based on temperature
          readJson(tempCelsius);
        });
      } else {
        setState(() {
          temperature = 'Failed to fetch data: ${response.statusCode}';
          forecast = '';
          weatherText = '';
        });
      }
    } catch (e) {
      setState(() {
        temperature = 'Failed to get location: $e';
        forecast = '';
        weatherText = '';
      });
    }
  }

//convert temp from kelvin to celcius
  double _convertTemp(double kelvin) {
    return kelvin - 273.15;
  }

  Future<void> readJson(double celciusTemp) async {
    final String response =
        await rootBundle.loadString('assets/suggestions.json');
    final data = json.decode(response);

    if (celciusTemp > 26) {
      setState(() {
        weatherText = 'Hot weather';
        _suggestions = (data["hotWeatherSuggestions"] as List)
            .map((item) => Item(
                  name: item['name'],
                  price: item['price'],
                  imagePath: item['imagePath'],
                  description: item['description'],
                ))
            .toList();
      });
    } else if (celciusTemp < 25) {
      setState(() {
        weatherText = 'Cold weather';
        _suggestions = (data["coldWeatherSuggestions"] as List)
            .map((item) => Item(
                  name: item['name'],
                  price: item['price'],
                  imagePath: item['imagePath'],
                  description: item['description'],
                ))
            .toList();
      });
    } else {
      setState(() {
        weatherText = 'Mild weather';
        _suggestions = (data["mildWeatherSuggestions"] as List)
            .map((item) => Item(
                  name: item['name'],
                  price: item['price'],
                  imagePath: item['imagePath'],
                  description: item['description'],
                ))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 254, 254),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weather today',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                Card(
                  elevation: 4,
                  color: Color.fromARGB(255, 248, 241, 239),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Row(
                            children: [
                              Icon(Icons.wb_sunny,
                                  size: 18,
                                  color: Color.fromARGB(255, 66, 33, 21)),
                              SizedBox(width: 10),
                              Text(
                                'Weather: ',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                weatherText,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Row(
                            children: [
                              Icon(Icons.cloud,
                                  size: 18,
                                  color: Color.fromARGB(255, 66, 33, 21)),
                              SizedBox(width: 10),
                              Text(
                                'Forecast: ',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                forecast,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Row(
                            children: [
                              Icon(Icons.thermostat,
                                  size: 18,
                                  color: Color.fromARGB(255, 66, 33, 21)),
                              SizedBox(width: 10),
                              Text(
                                'Temperature: ',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                '$temperature°C',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Suggestions',
                  style: TextStyle(fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 360,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _suggestions.length,
                      itemBuilder: (context, index) {
                        Item details = _suggestions[index];
                        return Row(
                          children: [
                            SizedBox(
                              width: 220,
                              child: ItemCard(
                                item: details,
                              ),
                            ),
                            SizedBox(width: 16),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    getWeatherData();
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Color.fromARGB(255, 66, 33, 21),
                  ),
                  label: Text(
                    'Refresh',
                    style: TextStyle(color: Color.fromARGB(255, 66, 33, 21)),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
