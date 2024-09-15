// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:weather_app_cubit/models/weather_model/weather_model.dart';
//
// import '../widgets/city_map_widget.dart';
// import '../widgets/location_widget.dart';
// import '../widgets/summary_card.dart';
// import '../widgets/toggle_buttons_widget.dart';
// import '../widgets/weather_info_widget.dart';
//
// class WeatherScreen extends StatelessWidget {
//   final WeatherModel weatherModel;
//   const WeatherScreen({
//     super.key,
//     required this.weatherModel,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.light,
//       statusBarBrightness: Brightness.dark,
//     ));
//
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             stops: [0.0, 1.0],
//             colors: [
//               Color(0xff000000),
//               Color(0xff123597),
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: CustomScrollView(
//             physics: const AlwaysScrollableScrollPhysics(),
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             style: TextButton.styleFrom(
//                               foregroundColor: Colors.white,
//                             ),
//                             child: const Text("Cancel"),
//                           ),
//                           TextButton(
//                             onPressed: () {},
//                             style: TextButton.styleFrom(
//                               foregroundColor: Colors.white,
//                             ),
//                             child: const Text("Add"),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 8.0),
//                     const LocationWidget(),
//                     const SizedBox(height: 16.0),
//                     WeatherInfoWidget(
//                       weatherModel: weatherModel,
//                     ),
//                     const SizedBox(height: 16.0),
//                     const ToggleButtonsWidget(),
//                     const SizedBox(height: 16.0),
//                     // const WeatherForecastWidget(),
//                     const SizedBox(height: 16.0), const CityMapScreen(),
//                     const SizedBox(height: 16.0),
//                     const SummaryCard(),
//
//                     // Container(
//                     //   height: 1200,
//                     //   width: double.infinity,
//                     //   padding: const EdgeInsets.symmetric(
//                     //       horizontal: 16.0, vertical: 32),
//                     //   color: Colors.white.withOpacity(0.2),
//                     //   child: const Column(
//                     //     children: [
//                     //       CityMapScreen(),
//                     //       SizedBox(height: 16.0),
//                     //       SummaryCard(
//                     //         pressure: 13,
//                     //         sunrise: "05:21",
//                     //         sunset: "07:45",
//                     //         feelsLike: 33,
//                     //         windSpeed: 42,
//                     //         maxTemperature: 40,
//                     //         minTemperature: 33,
//                     //         date: "Today",
//                     //         deg: 180,
//                     //         gust: 50,
//                     //         humidity: 50,
//                     //         lat: 30.0444,
//                     //         lon: 31.2357,
//                     //         seaLevel: 1013,
//                     //         speed: 10,
//                     //         temp: 30,
//                     //         tempMax: 32,
//                     //         tempMin: 28,
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
