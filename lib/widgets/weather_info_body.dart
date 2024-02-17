import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weathe_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:intl/intl.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weatherModel})
      : super(key: key);

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          getThemeColor(weatherModel.weatherCondition)[500]!,
          getThemeColor(weatherModel.weatherCondition)[300]!,
          getThemeColor(weatherModel.weatherCondition)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Updated at: ${getFormattedTime(weatherModel.date)}',
                style: const TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    "https:${weatherModel.image}",
                    height: 150,
                    width: 80,
                  ),
                  Text(
                    '${weatherModel.temp.round().toString()}°',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Max Temp: ${weatherModel.maxTemp.round()}°',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Min Temp: ${weatherModel.minTemp.round()}°',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Weather State: ${weatherModel.weatherCondition}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getFormattedTime(String value) {
  DateTime dateTime = DateTime.parse(value);
  String formattedTime =
      DateFormat('hh:mm a').format(dateTime); // Use 'hh' for 12-hour format
  return formattedTime;
}
