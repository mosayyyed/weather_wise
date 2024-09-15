import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class CityMapScreen extends StatelessWidget {
  const CityMapScreen({super.key});

  // Function to open Google Maps with the given coordinates
  Future<void> _openGoogleMaps(LatLng coordinates) async {
    final url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${coordinates.latitude},${coordinates.longitude}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not open Google Maps.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: SizedBox(
          height: 220,
          width: double.infinity,
          child: FlutterMap(
            options: MapOptions(
              backgroundColor: Colors.white.withOpacity(0.2),
              initialCenter: const LatLng(30.0626, 31.2497),
              initialZoom: 12,
              onTap: (tapPosition, latLng) {
                _openGoogleMaps(latLng);
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
