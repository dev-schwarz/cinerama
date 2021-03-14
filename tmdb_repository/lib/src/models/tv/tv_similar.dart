part of '_tv.dart';

@JsonSerializable()
class SimilarTvs extends TResultsObject<TvResumed> {
  SimilarTvs({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<TvResumed> results;

  factory SimilarTvs.fromJson(Map<String, dynamic> json) => _$SimilarTvsFromJson(json);

  Map<String, dynamic> toJson() => _$SimilarTvsToJson(this);

  @override
  SimilarTvs mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return SimilarTvs(
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
