import 'package:flutter/material.dart';

class GenreChip extends StatelessWidget {
  final String text;
  final Border? divider;

  const GenreChip({super.key, required this.text, this.divider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0D11),
        borderRadius: BorderRadius.circular(20),
        border:
            divider ??
            Border.all(color: const Color.fromRGBO(255, 255, 255, 0.16)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
