import 'package:flutter/material.dart';
import 'package:movie_info_app/ui/home/widgets/movie_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final currentMovies = List.generate(
      20,
      (index) => 'https://picsum.photos/200/300?random=$index',
    );
    final popularMovies = List.generate(
      20,
      (index) => 'https://picsum.photos/200/300?random=${index + 20}',
    );
    final topRatedMovies = List.generate(
      20,
      (index) => 'https://picsum.photos/200/300?random=${index + 40}',
    );
    final upcomingMovies = List.generate(
      20,
      (index) => 'https://picsum.photos/200/300?random=${index + 60}',
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            // "가장 인기있는" 타이틀
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text(
                  '가장 인기있는',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // 메인 배너 이미지
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/800/400',
                width: double.infinity,
                height: 550,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "현재 상영중",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            MovieCardList(imageUrls: currentMovies, showRanking: false),
            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "인기순",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            MovieCardList(imageUrls: popularMovies, showRanking: true),
            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "평점 높은순",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            MovieCardList(imageUrls: topRatedMovies, showRanking: false),
            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "개봉예정",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            MovieCardList(imageUrls: upcomingMovies, showRanking: false),
          ],
        ),
      ),
    );
  }
}
