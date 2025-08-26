import 'package:flutter/material.dart';
import 'package:movie_info_app/detail/detail_page.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final int? index;
  final bool showRanking;
  final String? movieImageUrl;
  final int? movieIndex;

  const MovieCard({
    super.key,
    required this.imageUrl,
    this.index,
    this.showRanking = false,
    this.movieImageUrl,
    this.movieIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          if (imageUrl.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  imageUrl: imageUrl,
                  index: index ?? 0,
                  heroTag: '',
                ),
              ),
            );
          } else {
            debugPrint('MovieCard onTap ignored: imageUrl is empty');
          }
        } catch (e) {
          debugPrint('Error navigating to DetailPage: $e');
        }
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: 120,
                height: 180,
              ),
            ),
            if (showRanking && index != null)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha((0.9 * 255).toInt()),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$index',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withAlpha((0.7 * 255).toInt()),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
