import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieDbResponse {
    final Dates? dates;
    final int page;
    final List<MovieMovieDB> results;
    final int totalPages;
    final int totalResults;

    MovieDbResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory MovieDbResponse.fromJson(Map<String, dynamic> json) => MovieDbResponse(
      dates: json['dates'] != null
        ? Dates.fromJson(json['dates'] as Map<String, dynamic>) 
        : null,
      page: json['page'] is int ? json['page'] as int : 0,
      results: json['results'] is List<dynamic> 
        ? (json['results'] as List<dynamic>)
          .map((x) => MovieMovieDB.fromJson(x as Map<String, dynamic>))
          .toList()
        : [], // Retorna una lista vacía si no es una lista
      totalPages: json['total_pages'] is int ? json['total_pages'] as int : 0,
      totalResults: json['total_results'] is int ? json['total_results'] as int : 0,
    );

    Map<String, dynamic> toJson() => {
        'dates': dates?.toJson(),
        'page': page,
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
        'total_pages': totalPages,
        'total_results': totalResults,
    };
}

class Dates {
    final DateTime maximum;
    final DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json['maximum'] as String),
        minimum: DateTime.parse(json['minimum'] as String),
    );

    Map<String, dynamic> toJson() => {
        'maximum': "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        'minimum': "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}