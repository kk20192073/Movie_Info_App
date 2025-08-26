import 'package:flutter/material.dart';
import 'package:movie_info_app/ui/detail/widgets/movie_header.dart';
import 'package:movie_info_app/ui/detail/widgets/genre_chips.dart';
import 'package:movie_info_app/ui/detail/widgets/overview_section.dart';
import 'package:movie_info_app/ui/detail/widgets/stats_section.dart';
import 'package:movie_info_app/ui/detail/widgets/studios_section.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required String imageUrl, required int index});

  static const movies = [
    {
      "title": "Moana 2",
      "releaseDate": "2024-11-27",
      "tagline": "The ocean is calling them back.",
      "runtime": "100분",
      "posterUrl": "https://picsum.photos/1200/800?1",
      "genres": ["Animation", "Adventure", "Family", "Comedy"],
      "overview":
          "After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new crew to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she's ever faced.",
      "stats": [
        {"value": "466.535", "label": "인기/점수"},
        {"value": "\$150,000,000", "label": "예산"},
        {"value": "\$4,235,856,850", "label": "수익"},
      ],
      "studios": [
        "Walt Disney\nPictures",
        "Walt Disney\nAnimation Studios",
        "Walt Disney\nStudios",
      ],
    },
    {
      "title": "Avatar",
      "releaseDate": "2009-12-18",
      "tagline": "Enter the World of Pandora.",
      "runtime": "162분",
      "posterUrl": "https://picsum.photos/1200/800?2",
      "genres": ["SF", "Action", "Adventure"],
      "overview":
          "On the lush alien world of Pandora live the Na'vi, beings who appear primitive but are highly evolved. Jake Sully, a paralyzed former Marine, becomes mobile again through one such Avatar and falls in love with a Na'vi woman.",
      "stats": [
        {"value": "750.123", "label": "인기/점수"},
        {"value": "\$237,000,000", "label": "예산"},
        {"value": "\$2,923,706,026", "label": "수익"},
      ],
      "studios": [
        "Lightstorm\nEntertainment",
        "20th Century\nFox",
        "Dune\nEntertainment",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    // final divider = Border.all(color: Color.fromRGBO(255, 255, 255, 0.10));

    return Scaffold(
      backgroundColor: const Color(0xFF0F1115),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
            Navigator.pop(context);
          }
        },
        child: PageView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            final List<dynamic> genres =
                movie["genres"] as List<dynamic>? ?? [];
            final List<dynamic> stats = movie["stats"] as List<dynamic>? ?? [];
            final List<dynamic> studios =
                movie["studios"] as List<dynamic>? ?? [];
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 60),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Hero(
                      tag: 'movie-poster-$index',
                      child: SizedBox(
                        height: 595,
                        width: double.infinity,
                        child: Image.network(
                          movie["posterUrl"]?.toString() ?? "",
                          fit: BoxFit.cover,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded || frame != null) {
                                  return child;
                                } else {
                                  return Container(
                                    color: const Color(0xFF151922),
                                  );
                                }
                              },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.black,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Main content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieHeader(
                          title: movie["title"]?.toString() ?? "",
                          releaseDate: movie["releaseDate"]?.toString() ?? "",
                          tagline: movie["tagline"]?.toString() ?? "",
                          runtime: movie["runtime"]?.toString() ?? "",
                        ),

                        Divider(color: Colors.white24, thickness: 0.5),

                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (var g in genres)
                              GenreChip(text: g?.toString() ?? ""),
                          ],
                        ),

                        Divider(color: Colors.white24, thickness: 0.5),

                        OverviewSection(
                          overview: movie["overview"]?.toString() ?? "",
                        ),

                        SizedBox(height: 18),

                        Divider(color: Colors.white24, thickness: 0.5),
                        Text(
                          "흥행정보",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        SizedBox(height: 10),

                        LayoutBuilder(
                          builder: (context, c) {
                            final gap = 10.0;
                            final col = 3;
                            final w = (c.maxWidth - gap * (col - 1)) / col;
                            return Wrap(
                              spacing: gap,
                              runSpacing: gap,
                              children: [
                                for (var s in stats)
                                  SizedBox(
                                    width: w,
                                    child: StatCard(
                                      value: (s is Map && s["value"] != null)
                                          ? s["value"]?.toString() ?? ""
                                          : "",
                                      label: (s is Map && s["label"] != null)
                                          ? s["label"]?.toString() ?? ""
                                          : "",
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),

                        SizedBox(height: 18),

                        Text(
                          "제작사",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        Divider(color: Colors.white24, thickness: 0.5),
                        SizedBox(height: 10),

                        Row(
                          children: [
                            for (var i = 0; i < studios.length; i++) ...[
                              Expanded(
                                child: StudioCard(
                                  name: studios[i]?.toString() ?? "",
                                ),
                              ),
                              if (i != studios.length - 1) SizedBox(width: 10),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),
                  Center(
                    child: Container(
                      width: 140,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.18),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
