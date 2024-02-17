import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'There is no weather 😔 ',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'search now 🔎 ',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
