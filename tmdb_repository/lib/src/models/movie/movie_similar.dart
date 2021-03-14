part of '_movie.dart';

@JsonSerializable()
class SimilarMovies extends TResultsObject<MovieResumed> {
  SimilarMovies({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<MovieResumed> results;

  factory SimilarMovies.fromJson(Map<String, dynamic> json) => _$SimilarMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$SimilarMoviesToJson(this);

  @override
  SimilarMovies mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return SimilarMovies(
      page: other.page,
      totalPages: other.totalPages,
      totalResults: other.totalResults,
      results: [
        if (results != null) ...results,
        ...other.results,
      ],
    );
  }
}
