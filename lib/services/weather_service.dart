import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'api.weatherapi.com';
  final String apiKey = 'ee159ad8acab4ec092885340241402';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          'https://$baseUrl/v1/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMassage = e.response?.data['error']['massage'] ??
          'oops there was an error try later!';
      throw Exception(errorMassage);
    } catch (e) {
      throw Exception('oops there was an error try later!');
    }
  }
}
