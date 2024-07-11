part of 'get_weather_cubit_cubit.dart';

@immutable
sealed class GetWeatherCubitState {}

final class GetWeatherCubitInitial extends GetWeatherCubitState {}

final class WeatherLoadedState extends GetWeatherCubitState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

final class WeatherFailureState extends GetWeatherCubitState {
  final String errMassage;
  
  WeatherFailureState(this.errMassage);
}
