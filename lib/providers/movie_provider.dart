import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/movie.dart';
import '../repository/movie_repository.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepository();
});

final movieProvider = FutureProvider<List<Movie>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  final repository = ref.watch(movieRepositoryProvider);
  return repository.fetchMovies(query);
});