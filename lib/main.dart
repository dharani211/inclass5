import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Weather App - Static'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = '';
  double _temperature = 0.0;
  String _weatherCondition = '';

  void _fetchWeather() async {
    final cityName = _cityController.text;

    // Generate random temperature between 15°C and 30°C
    final randomTemperature = Random().nextInt(16) + 15;

    // Randomly select a weather condition
    final weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];
    final randomWeatherCondition =
        weatherConditions[Random().nextInt(weatherConditions.length)];

    setState(() {
      _cityName = cityName;
      _temperature = randomTemperature.toDouble();
      _weatherCondition = randomWeatherCondition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                hintText: 'Enter city name',
              ),
            ),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 20),
            Text(
              'City: $_cityName',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Temperature: $_temperature°C',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Weather Condition: $_weatherCondition',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
