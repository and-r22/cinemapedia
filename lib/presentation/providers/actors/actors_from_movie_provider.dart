import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsFromMovieProvider = StateNotifierProvider<ActorsFromMovieNotifier, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);

  return ActorsFromMovieNotifier(
    getActors: actorsRepository.getActorsByMovie,
  );
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsFromMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  ActorsFromMovieNotifier({
    required this.getActors,
  }) : super({});

  final GetActorsCallback getActors;

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await getActors(movieId);
    state = {...state, movieId: actors}; // Asignamos una lista de actores
  }
}