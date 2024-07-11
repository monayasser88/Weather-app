import 'package:flutter/material.dart';

class NoWeatherInfo extends StatelessWidget {
  const NoWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'There is no weather 😢 ',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            Text(
              'Start searching now! 🔍',
              style: TextStyle(fontSize: 24, color: Colors.black),
            )
          ],
        ),
      );
  }
}