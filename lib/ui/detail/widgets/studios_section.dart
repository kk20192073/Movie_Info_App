import 'package:flutter/material.dart';

class StudioCard extends StatelessWidget {
  final String name;

  const StudioCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0D11),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.16)),
      ),
      alignment: Alignment.center,
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
