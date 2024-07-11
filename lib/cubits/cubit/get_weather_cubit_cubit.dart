import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_update/models/weather_model.dart';
import '../../services/weather_service.dart';
part 'get_weather_cubit_state.dart';

class GetWeatherCubitCubit extends Cubit<GetWeatherCubitState> {
  GetWeatherCubitCubit() : super(GetWeatherCubitInitial());
    WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
        weatherModel =
        (await WeatherService(Dio()).getCurrentWeather(cityName: cityName))!;
    if (weatherModel != null) {
      emit(WeatherLoadedState(weatherModel!));
    } else {
      emit(WeatherFailureState("Weather data is null"));
    }
  }
}
