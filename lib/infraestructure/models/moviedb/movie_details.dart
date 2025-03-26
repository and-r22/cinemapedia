class MovieDetails {
    final bool adult;
    final String backdropPath;
    final BelongsToCollection? belongsToCollection;
    final int budget;
    final List<Genre> genres;
    final String homepage;
    final int id;
    final String imdbId;
    final List<String> originCountry;
    final String originalLanguage;
    final String originalTitle;
    final String overview;
    final double popularity;
    final String posterPath;
    final List<ProductionCompany> productionCompanies;
    final List<ProductionCountry> productionCountries;
    final DateTime releaseDate;
    final int revenue;
    final int runtime;
    final List<SpokenLanguage> spokenLanguages;
    final String status;
    final String tagline;
    final String title;
    final bool video;
    final double voteAverage;
    final int voteCount;

    MovieDetails({
        required this.adult,
        required this.backdropPath,
        required this.belongsToCollection,
        required this.budget,
        required this.genres,
        required this.homepage,
        required this.id,
        required this.imdbId,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.productionCompanies,
        required this.productionCountries,
        required this.releaseDate,
        required this.revenue,
        required this.runtime,
        required this.spokenLanguages,
        required this.status,
        required this.tagline,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        adult: json['adult'] as bool,
        backdropPath: json['backdrop_path'] != null ?  json['backdrop_path']as String : '',
        belongsToCollection: json['belongs_to_collection'] == null ? null : BelongsToCollection.fromJson(json['belongs_to_collection'] as Map<String, dynamic>),
        budget: json['budget'] as int,
        genres: (json['genres'] as List<dynamic>)
          .map((x) => Genre.fromJson(x as Map<String, dynamic>))
          .toList(),
        homepage: json['homepage'] as String,
        id: json['id'] as int,
        imdbId: json['imdb_id'] != null ? json['imdb_id']as String : '',
        originCountry: List<String>.from(json['origin_country'] as List<dynamic>),
        originalLanguage: json['original_language'] as String,
        originalTitle: json['original_title'] as String,
        overview: json['overview'] as String,
        popularity: json['popularity']?.toDouble() as double,
        posterPath: json['poster_path'] as String,
        productionCompanies: (json['production_companies'] as List<dynamic>)
          .map((x) => ProductionCompany.fromJson(x as Map<String, dynamic>))
          .toList(),
        productionCountries: (json['production_countries'] as List<dynamic>)
          .map((x) => ProductionCountry.fromJson(x as Map<String, dynamic>))
          .toList(),
        releaseDate: json['release_date'] != null
          ? DateTime.tryParse(json['release_date'] as String) ?? DateTime(1900, 1, 1)
          : DateTime(1900, 1, 1),
        revenue: json['revenue'] as int,
        runtime: json['runtime'] as int,
        spokenLanguages: (json['spoken_languages'] as List<dynamic>)
          .map((x) => SpokenLanguage.fromJson(x as Map<String, dynamic>))
          .toList(),
        status: json['status'] as String,
        tagline: json['tagline'] as String,
        title: json['title'] as String,
        video: json['video'] as bool,
        voteAverage: json['vote_average']?.toDouble() as double,
        voteCount: json['vote_count'] as int,
    );

    Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'belongs_to_collection': belongsToCollection?.toJson(),
        'budget': budget,
        'genres': List<dynamic>.from(genres.map((x) => x.toJson())),
        'homepage': homepage,
        'id': id,
        'imdb_id': imdbId,
        'origin_country': List<dynamic>.from(originCountry.map((x) => x)),
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'production_companies': List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        'production_countries': List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        'release_date': "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        'revenue': revenue,
        'runtime': runtime,
        'spoken_languages': List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        'status': status,
        'tagline': tagline,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
    };
}

class BelongsToCollection {
  BelongsToCollection({
    required this.id, 
    required this.name, 
    required this.posterPath, 
    required this.backdropPath
  });

  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) => BelongsToCollection(
    id: json['id'] as int, 
    name: json['name'] as String, 
    posterPath: json['posterPath'] == null ? '' : json['posterPath'] as String, 
    backdropPath: json['backdropPath'] == null ? '' : json['backdropPath'] as String
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'posterPath': posterPath,
    'backdropPath': backdropPath
  };
}

class Genre {
    final int id;
    final String name;

    Genre({
        required this.id,
        required this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'] as int,
        name: json['name'] as String,
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
    };
}

class ProductionCompany {
    final int id;
    final String logoPath;
    final String name;
    final String originCountry;

    ProductionCompany({
        required this.id,
        required this.logoPath,
        required this.name,
        required this.originCountry,
    });

    factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
        id: json['id'] as int,
        logoPath: json['logo_path'] == null ? '' : json['logo_path'] as String,
        name: json['name'] as String,
        originCountry: json['origin_country'] as String,
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
    };
}

class ProductionCountry {
    final String iso31661;
    final String name;

    ProductionCountry({
        required this.iso31661,
        required this.name,
    });

    factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json['iso_3166_1'] as String,
        name: json['name'] as String,
    );

    Map<String, dynamic> toJson() => {
        'iso_3166_1': iso31661,
        'name': name,
    };
}

class SpokenLanguage {
    final String englishName;
    final String iso6391;
    final String name;

    SpokenLanguage({
        required this.englishName,
        required this.iso6391,
        required this.name,
    });

    factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json['english_name'] as String,
        iso6391: json['iso_639_1'] as String,
        name: json['name'] as String,
    );

    Map<String, dynamic> toJson() => {
        'english_name': englishName,
        'iso_639_1': iso6391,
        'name': name,
    };
}
