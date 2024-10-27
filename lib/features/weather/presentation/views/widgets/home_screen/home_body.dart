import 'package:flutter/material.dart';

import 'home_app_bar.dart';
import 'home_screen_body.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
