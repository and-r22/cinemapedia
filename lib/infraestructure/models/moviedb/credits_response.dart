class CreditsResponse {
    final int id;
    final List<Cast> cast;
    final List<Cast> crew;

    CreditsResponse({
        required this.id,
        required this.cast,
        required this.crew,
    });

    factory CreditsResponse.fromJson(Map<String, dynamic> json) => CreditsResponse(
        id: json['id'] as int,
        cast: List<Cast>.from((json['cast'] as List<dynamic>).map((x) => Cast.fromJson(x as Map<String, dynamic>))),
        crew: List<Cast>.from((json['crew'] as List<dynamic>).map((x) => Cast.fromJson(x as Map<String, dynamic>))),
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'cast': List<dynamic>.from(cast.map((x) => x.toJson())),
        'crew': List<dynamic>.from(crew.map((x) => x.toJson())),
    };
}

class Cast {
    final bool adult;
    final int gender;
    final int id;
    final String knownForDepartment;
    final String name;
    final String originalName;
    final double popularity;
    final String? profilePath;
    final int? castId;
    final String? character;
    final String creditId;
    final int? order;
    final String? department;
    final String? job;

    Cast({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        required this.profilePath,
        this.castId,
        this.character,
        required this.creditId,
        this.order,
        this.department,
        this.job,
    });

    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json['adult'] as bool,
        gender: json['gender'] as int,
        id: json['id'] as int,
        knownForDepartment: json['known_for_department'] as String? ?? '',  // Default to empty string if null
        name: json['name'] as String,
        originalName: json['original_name'] as String,
        popularity: json['popularity'] as double,  // Default to 0.0 if null
        profilePath: json['profile_path'] as String?,
        castId: json['cast_id'] as int?,  // Nullable
        character: json['character'] as String?,
        creditId: json['credit_id'] as String,
        order: json['order'] as int?,
        department: json['department'] as String?,
        job: json['job'] as String?,
    );

    Map<String, dynamic> toJson() => {
        'adult': adult,
        'gender': gender,
        'id': id,
        'known_for_department': knownForDepartment,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
        'cast_id': castId,
        'character': character,
        'credit_id': creditId,
        'order': order,
        'department': department,
        'job': job,
    };
}