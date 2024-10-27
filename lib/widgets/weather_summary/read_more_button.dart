import 'package:flutter/material.dart';

class ReadMoreButton extends StatelessWidget {
  final bool showMore;
  final VoidCallback onPressed;

  const ReadMoreButton({
    super.key,
    required this.showMore,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          showMore ? 'Read Less' : 'Read More',
          style: const TextStyle(color: Colors.blue, fontSize: 16.0),
        ),
      ),
    );
  }
}
