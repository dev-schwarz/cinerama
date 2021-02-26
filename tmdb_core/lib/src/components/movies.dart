part of '../core.dart';

class CoreMovies {
  static const _startPoint = 'movie';

  CoreMovies(this._core);

  final TmdbCore _core;

  /// Get the primary information about a movie.
  Future<Map> getDetails(
    int id, {
    String language,
    List<String> append,
    List<String> includeImageLanguages,
  }) {
    _checkNotNull(id, 'id');

    if ((includeImageLanguages?.isNotEmpty ?? false) &&
        (append == null || !append.contains('images'))) {
      append = <String>[if (append != null) ...append, 'images'];
    }

    _Params params = _Params();
    params['language'] = language;
    params['append_to_response'] = append;
    params['include_image_language'] = includeImageLanguages;
    return _core._query3('$_startPoint/$id', params: params);
  }

  /// Get the following account states for a session.
  /// - Movie rating.
  /// - If it belongs to your watchlist.
  /// - if it belongs to your favorite list.
  Future<Map> getAccountStates(int id, {String language}) {
    _checkNotNull(id, 'id');
    _Params params = _Params.withSession('');
    params['language'] = language;
    return _core._query3(
      '$_startPoint/$id/account_states',
      params: params,
    );
  }

  /// Get the cast and crew for a movie.
  Future<Map> getCredits(int id, {List<String> append}) {
    _checkNotNull(id, 'id');
    _Params params = _Params();
    params['language'] = 'pt-BR';
    return _core._query3('$_startPoint/$id/credits', params: params);
  }

  /// Get a list of recommended movies for a movie.
  Future<Map> getRecommendations(int id, {String language, int page}) {
    _checkNotNull(id, 'id');
    _Params params = _Params();
    params['language'] = language;
    params['page'] = page;
    return _core._query3('$_startPoint/$id/recommendations', params: params);
  }

  /// Rate a movie.
  ///
  /// A valid session or guest session ID is required.
  ///
  /// The [value] of rate to submit is expected to be between
  /// 0.5 and 10.0, and must be a multiple of 0.50.
  Future<Map> rateMovie(int id, double value) {
    _checkNotNull(id, 'id');
    _checkNotNull(value, 'value');
    _Params params = _Params.withSession('');
    params['value'] = value;
    return _core._query3(
      '$_startPoint/$id/rating',
      params: params,
      method: _QueryMethod.POST,
    );
  }

  /// Remove your rating for a movie.
  ///
  /// A valid session or guest session ID is required.
  Future<Map> deleteRating(int id) {
    _checkNotNull(id, 'id');
    _Params params = _Params.withSession('');
    return _core._query3(
      '$_startPoint/$id/rating',
      params: params,
      method: _QueryMethod.DELETE,
    );
  }

  /// Get a list of the current popular movies on TMDb.
  /// This list updates daily.
  Future<Map> getPopular({String language, int page, String region}) {
    _Params params = _Params();
    params['language'] = language;
    params['page'] = page;
    params['region'] = region;
    return _core._query3('$_startPoint/popular', params: params);
  }

  /// Get the top rated movies on TMDb.
  Future<Map> getTopRated({String language, int page, String region}) {
    _Params params = _Params();
    params['language'] = language;
    params['page'] = page;
    params['region'] = region;
    return _core._query3('$_startPoint/top_rated', params: params);
  }
}
