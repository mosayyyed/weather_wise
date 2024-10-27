import 'package:flutter/material.dart';

class ToggleButtonsWidget extends StatelessWidget {
  const ToggleButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: const Center(
            child: Text(
              'Daily',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: const Center(
            child: Text(
              'Weekly',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
