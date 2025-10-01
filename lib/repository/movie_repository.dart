import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';
import '../core/constants.dart';

class MovieRepository {
  Future<List<Movie>> fetchMovies(String query) async {
    final url = query.isEmpty
        ? '${ApiConstants.baseUrl}/movie/popular?api_key=${ApiConstants.apiKey}&language=en-US&page=1'
        : '${ApiConstants.baseUrl}/search/movie?api_key=${ApiConstants.apiKey}&language=en-US&query=$query';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List results = jsonData['results'];
      return results.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}