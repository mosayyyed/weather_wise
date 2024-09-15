/*
import 'package:flutter/material.dart';

import 'location_widget.dart';
import 'weather_info_widget.dart';

class WeatherSliverAppBar extends StatelessWidget {
  const WeatherSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      pinned: true,
      expandedHeight: 500.0,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Calculate the shrink percentage
          var percentage = (constraints.maxHeight - kToolbarHeight) /
              (100.0 - kToolbarHeight);

          return FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.0),
                  LocationWidget(),
                  SizedBox(height: 16.0),
                  WeatherInfoWidget(),
                ],
              ),
            ),
            title: percentage < 0.5
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocationWidget(),
                      WeatherInfoWidget(),
                    ],
                  )
                : null,
          );
        },
      ),
    );
  }
}
*/
