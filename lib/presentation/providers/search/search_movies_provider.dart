import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String> ((ref) => '');

final serachedMoviesProvider = StateNotifierProvider<SearchMoviesNotifier, List<Movie>> ((ref) {

  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchMoviesNotifier(
    movieRepository.searchMovies, 
    ref
  );

});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {

  final SearchMoviesCallback searchMovies;
  final Ref ref;
  
  SearchMoviesNotifier(
    this.searchMovies, 
    this.ref,
  ): super([]);

  Future<List<Movie>> searchMoviesByQuery (String query) async {

    final movies = await searchMovies(query);

    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }

}