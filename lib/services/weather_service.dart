import 'package:dio/dio.dart';
import 'package:weather_update/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String API = 'bc563cea34da46ada3f153609230408';
  WeatherService(this.dio);

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$API&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      print(response);
      return weatherModel;
    } on DioException catch (e) {
      // TODO
      final String errorMassage = e.response?.data['error']['massage'] ??
          'oops there was an error, try later';
      throw Exception(errorMassage);
    } catch (e) {
      print(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}
