import 'package:flutter/material.dart';
import 'package:movie_info_app/detail/detail_page.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final int? index;
  final bool showRanking;
  final int listId;

  const MovieCard({
    super.key,
    required this.imageUrl,
    this.index,
    this.showRanking = false,
    this.listId = 0,
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
                  heroTag:
                      'movie-poster-list-$listId-idx${index ?? 0}-ranking${showRanking ? 1 : 0}',
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
        width: 160,
        margin: const EdgeInsets.only(right: 12, left: 0),
        child: Stack(
          clipBehavior: Clip.none, // 숫자가 바깥으로 나가도 보이도록
          children: [
            // 이미지
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 160,
                  height: 200,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 160,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.broken_image,
                        size: 60,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            // 인기순 숫자
            if (showRanking && index != null)
              Positioned(
                left: -25, // 살짝 바깥쪽
                bottom: -10, // 숫자 하단 살짝 내림
                child: Text(
                  '$index',
                  style: TextStyle(
                    fontSize: 120, // 크게
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withAlpha((0.9 * 255).toInt()),
                    height: 1.0,
                    shadows: [
                      Shadow(
                        blurRadius: 8,
                        color: Colors.black.withAlpha((0.7 * 255).toInt()),
                        offset: const Offset(3, 3),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MovieCardList extends StatelessWidget {
  final List<String> imageUrls;
  final bool showRanking;
  final int listId;

  const MovieCardList({
    super.key,
    required this.imageUrls,
    this.showRanking = false,
    this.listId = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: showRanking
          ? 220
          : 240, // 숫자가 커졌으니 살짝 늘림, non-ranking slightly taller to show full card
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: showRanking ? 20 : 6),
        itemBuilder: (context, index) {
          return Transform.translate(
            offset: showRanking
                ? const Offset(20, 0)
                : const Offset(
                    -12,
                    0,
                  ), // non-ranking moved up to be fully visible
            child: MovieCard(
              imageUrl: imageUrls[index],
              index: showRanking ? index + 1 : null,
              showRanking: showRanking,
              listId: listId,
            ),
          );
        },
      ),
    );
  }
}
