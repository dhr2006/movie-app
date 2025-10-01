import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../core/constants.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final posterUrl = movie.posterPath != null
        ? '${ApiConstants.baseImageUrl}${movie.posterPath}'
        : 'https://via.placeholder.com/500x750?text=No+Image';

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  posterUrl,
                  height: 400,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 64),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Rating: ${movie.voteAverage.toStringAsFixed(1)} ⭐',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              movie.overview,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}