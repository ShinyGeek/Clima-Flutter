import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

const api = '9e44267c3689c3309ca2b59cd66a504b';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = new Location();

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  Future<void> getData() async {
    Uri target = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api');
    http.Response response = await http.get(target);
    if (response.statusCode == 200) {
      dynamic result = jsonDecode(response.body);
      print(result['name']);
      print('Response: ${response.body.toString()}');
    } else {
      print(response.statusCode);
    }
  }

  void getLocation() async {
    await location.getCurrentLocation();
    print('Lat: ${location.latitude}');
    print('Lon: ${location.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Container(
        child: Center(),
      ),
    );
  }
}
