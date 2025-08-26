import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;

  const StatCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(255, 255, 255, 0.16),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.8),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
