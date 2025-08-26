import 'package:flutter/material.dart';

class OverviewSection extends StatelessWidget {
  final String overview;

  const OverviewSection({required this.overview, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      overview,
      style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
    );
  }
}
