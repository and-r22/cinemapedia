class MovieMovieDB {
    final bool adult;
    final String backdropPath;
    final List<int> genreIds;
    final int id;
    final String originalLanguage;
    final String originalTitle;
    final String overview;
    final double popularity;
    final String? posterPath;
    final DateTime? releaseDate;
    final String title;
    final bool video;
    final double voteAverage;
    final int voteCount;

    MovieMovieDB({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory MovieMovieDB.fromJson(Map<String, dynamic> json) => MovieMovieDB(
      adult: json['adult'] as bool? ?? false,  // Asegúrate de que 'adult' sea un booleano
      backdropPath: json['backdrop_path'] as String? ?? '',  // Si es null, asigna cadena vacía
      genreIds: List<int>.from((json['genre_ids'] as List<dynamic>?)?.map((x) => x as int) ?? []), // Corrección aquí
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String? ?? '',  // Manejo de null con valor predeterminado
      originalTitle: json['original_title'] as String? ?? '',  // Manejo de null con valor predeterminado
      overview: json['overview'] as String? ?? '',  // Si es null, asigna cadena vacía
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,  // Evita null y convierte a double
      posterPath: json['poster_path'] as String? ?? '',  // Si es null, asigna cadena vacía
      releaseDate: json['release_date'] != null && json['release_date'].toString().isNotEmpty
          ? DateTime.tryParse(json['release_date'] as String) // Manejo de fechas inválidas
          : null, // Si es null, asignamos una fecha predeterminada
      title: json['title'] as String? ?? '',  // Manejo de null con valor predeterminado
      video: json['video'] as bool? ?? false,  // Asegúrate de que 'video' sea un booleano
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0, // Evita null y convierte a double
      voteCount: json['vote_count'] as int? ?? 0,  // Si es null, asigna 0
    );

    Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': List<dynamic>.from(genreIds.map((x) => x)),
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate != null 
          ? "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}"
          : null,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
    };
}