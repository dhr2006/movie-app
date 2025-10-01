import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../screens/detail_screen.dart';
import '../core/constants.dart';

class MovieGridItem extends StatelessWidget {
  final Movie movie;
  const MovieGridItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final posterUrl = movie.posterPath != null
        ? '${ApiConstants.baseImageUrl}${movie.posterPath}'
        : 'https://via.placeholder.com/300x450?text=No+Image';

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailScreen(movie: movie)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                posterUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 48),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.purpleAccent,
            ),
          ),
        ],
      ),
    );
  }
}