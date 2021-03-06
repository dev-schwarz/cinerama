import 'package:tmdb_repository/tmdb_repository.dart';

class DiscoverMoviesFilters {
  DiscoverMoviesFilters._({
    this.sortBy,
    this.primaryReleaseYear,
    this.year,
    this.releaseDateGte,
    this.releaseDateLte,
    this.voteCountGte,
    this.voteCountLte,
    this.voteAverageGte,
    this.voteAverageLte,
  });

  factory DiscoverMoviesFilters({
    DiscoverMovieSortBy sortBy,
    String primaryReleaseYear,
    String year,
    String releaseDateGte,
    String releaseDateLte,
    String voteCountGte,
    String voteCountLte,
    String voteAverageGte,
    String voteAverageLte,
  }) {
    return DiscoverMoviesFilters._(
      sortBy: sortBy ?? DiscoverMovieSortBy.popularity.desc,
      primaryReleaseYear: primaryReleaseYear ?? '',
      year: year ?? '',
      releaseDateGte: releaseDateGte ?? '',
      releaseDateLte: releaseDateLte ?? '',
      voteCountGte: voteCountGte ?? '',
      voteCountLte: voteCountLte ?? '',
      voteAverageGte: voteAverageGte ?? '',
      voteAverageLte: voteAverageLte ?? '',
    );
  }

  DiscoverMoviesFilters copyWith({
    DiscoverMovieSortBy sortBy,
    String primaryReleaseYear,
    String year,
    String releaseDateGte,
    String releaseDateLte,
    String voteCountGte,
    String voteCountLte,
    String voteAverageGte,
    String voteAverageLte,
  }) {
    return DiscoverMoviesFilters._(
      sortBy: sortBy ?? this.sortBy,
      primaryReleaseYear: this.primaryReleaseYear,
      year: this.year,
      releaseDateGte: this.releaseDateGte,
      releaseDateLte: this.releaseDateLte,
      voteCountGte: this.voteCountGte,
      voteCountLte: this.voteCountLte,
      voteAverageGte: this.voteAverageGte,
      voteAverageLte: this.voteAverageLte,
    );
  }

  final DiscoverMovieSortBy sortBy;
  final String primaryReleaseYear;
  final String year;
  final String releaseDateGte;
  final String releaseDateLte;
  final String voteCountGte;
  final String voteCountLte;
  final String voteAverageGte;
  final String voteAverageLte;
}
