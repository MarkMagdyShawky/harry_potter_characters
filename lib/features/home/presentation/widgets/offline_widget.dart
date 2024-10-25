import 'package:flutter/material.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: 100,
            color: Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            'No internet connection',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
