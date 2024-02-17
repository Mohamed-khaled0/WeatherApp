import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {} // = No Weather State

class WeatherLoadedSuccesState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedSuccesState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errMassage;

  WeatherFailureState(this.errMassage);
}
