import '../../domain/entity/movie_detail.dart';
import 'genre_model.dart';
import 'production_company_model.dart';
import 'production_country_model.dart';
import 'spoken_language_model.dart';

class MovieDetailsModel extends MovieDetail {
  MovieDetailsModel({
    required bool adult,
    required String backdropPath,
    required int budget,
    required this.genres,
    required String homepage,
    required int id,
    required String imdbId,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required String releaseDate,
    required int revenue,
    required int runtime,
    required this.spokenLanguages,
    required String status,
    required String tagline,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) : super(
            adult: adult,
            backdropPath: backdropPath,
            budget: budget,
            genres: genres,
            homepage: homepage,
            id: id,
            imdbId: imdbId,
            originalTitle: originalTitle,
            originalLanguage: originalLanguage,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            productionCompanies: productionCompanies,
            productionCountries: productionCountries,
            releaseDate: releaseDate,
            revenue: revenue,
            runtime: runtime,
            spokenLanguages: spokenLanguages,
            status: status,
            tagline: tagline,
            title: title,
            video: video,
            voteAverage: voteAverage,
            voteCount: voteCount);
  final List<GenreModel> genres;
  final List<ProductionCompanyModel> productionCompanies;
  final List<ProductionCountryModel> productionCountries;
  final List<SpokenLanguageModel> spokenLanguages;

  factory MovieDetailsModel.fromJson(Map<String, dynamic>? json) =>
      MovieDetailsModel(
        adult: json?["adult"],
        backdropPath: json?["backdrop_path"] ?? '',
        budget: json?["budget"] ?? 0,
        genres: List<GenreModel>.from(
            json?["genres"]?.map((x) => GenreModel.fromJson(x))),
        homepage: json?["homepage"] ?? '',
        id: json?["id"],
        imdbId: json?["imdb_id"],
        originalLanguage: json?["original_language"] ?? '',
        originalTitle: json?["original_title"] ?? '',
        overview: json?["overview"] ?? '',
        popularity: json?["popularity"].toDouble() ?? 0.0,
        posterPath: json?["poster_path"] ?? '',
        productionCompanies: List<ProductionCompanyModel>.from(
            json?["production_companies"]
                .map((x) => ProductionCompanyModel.fromJson(x))),
        productionCountries: List<ProductionCountryModel>.from(
          json?["production_countries"].map(
            (x) => ProductionCountryModel.fromJson(x),
          ),
        ),
        releaseDate: json?["release_date"] ?? '',
        revenue: json?["revenue"] ?? 0,
        runtime: json?["runtime"] ?? 0,
        spokenLanguages: List<SpokenLanguageModel>.from(
            json?["spoken_languages"]
                .map((x) => SpokenLanguageModel.fromJson(x))),
        status: json?["status"] ?? '',
        tagline: json?["tagline"] ?? '',
        title: json?["title"] ?? '',
        video: json?["video"] ?? false,
        voteAverage: json?["vote_average"].toDouble() ?? 0.0,
        voteCount: json?["vote_count"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries":
            List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "release_date": releaseDate,
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages":
            List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
