import 'package:flutter/material.dart';

class MovieHeader extends StatelessWidget {
  final String title;
  final String releaseDate;
  final String tagline;
  final String runtime;

  const MovieHeader({
    super.key,
    required this.title,
    required this.releaseDate,
    required this.tagline,
    required this.runtime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              releaseDate,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          tagline,
          style: const TextStyle(fontSize: 13, color: Colors.white70),
        ),
        const SizedBox(height: 6),
        Text(
          runtime,
          style: const TextStyle(fontSize: 12, color: Colors.white60),
        ),
      ],
    );
  }
}
