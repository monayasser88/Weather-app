import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_update/cubits/cubit/get_weather_cubit_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Page',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit =
                  BlocProvider.of<GetWeatherCubitCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                suffixIcon: Icon(Icons.search),
                hintText: 'enter city name',
                label: Text(
                  'Search',
                  style: TextStyle(fontSize: 18),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.redAccent))),
          ),
        ),
      ),
    );
  }
}
