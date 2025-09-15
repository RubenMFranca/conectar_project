import 'package:flutter/material.dart';

class InsideInformation extends StatelessWidget {
  const InsideInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 50, color: Colors.grey),
          SizedBox(height: 10),
          Text(
            'Funcionalidade em desenvolvimento',
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
