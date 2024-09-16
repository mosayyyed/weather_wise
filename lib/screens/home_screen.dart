import 'package:flutter/material.dart';
import 'package:weather_app_cubit/widgets/home_screen/home_screen_body.dart';

import '../widgets/home_screen/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff000000),
              Color(0xff123597),
            ],
          ),
        ),
        child: const CustomScrollView(
          slivers: [
            HomeAppBar(),
            HomeScreenBody(),
          ],
        ),
      ),
    );
  }
}
