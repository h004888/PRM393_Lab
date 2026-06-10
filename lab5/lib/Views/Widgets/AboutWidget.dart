import 'package:flutter/material.dart';

class Aboutwidget extends StatelessWidget {
  const Aboutwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            "About Author",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text("Flutter Developer"),
        ],
      ),
    );
  }
}
