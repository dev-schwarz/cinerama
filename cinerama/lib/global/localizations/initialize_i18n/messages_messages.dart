// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  static m0(sortText) => "${Intl.select(sortText, {'popularity': 'Popularity', 'original_title': 'Original title', 'release_date': 'Release date', 'vote_average': 'Vote average', 'vote_count': 'Vote count', 'revenue': 'Revenue', })}";

  static m1(order) => "${Intl.select(order, {'asc': 'Ascending order', 'desc': 'Descending order', })}";

  static m2(firstLetterUCase) => "${Intl.select(firstLetterUCase, {'true': 'No', 'false': 'no', })}";

  static m3(firstLetterUCase) => "${Intl.select(firstLetterUCase, {'true': 'Yes', 'false': 'yes', })}";

  static m4(yes) => "${Intl.select(yes, {'true': 'yes', 'false': 'no', })}";

  static m5(value) => "${Intl.select(value, {'true': 'Remove from favorites', 'false': 'Add to favorites', })}";

  static m6(value) => "${Intl.select(value, {'true': 'Edit or remove your rating', 'false': 'Rate', })}";

  static m7(value) => "${Intl.select(value, {'true': 'Remove from watch list', 'false': 'Add to watch list', })}";

  static m8(added, howMany) => "${Intl.select(added, {'true': '${Intl.plural(howMany, zero: '', one: 'Added to 1 list. ', other: 'Added to ${howMany} lists. ')}', 'false': '${Intl.plural(howMany, zero: '', one: 'Removed from 1 list. ', other: 'Removed from ${howMany} lists. ')}', })}";

  static m9(value) => "${Intl.select(value, {'true': 'Added to favorites', 'false': 'Removed from favorites', })}";

  static m10(value) => "${Intl.select(value, {'true': 'Item rated', 'false': 'Item rating cleared', })}";

  static m11(value) => "${Intl.select(value, {'true': 'Added to watch list', 'false': 'Removed from watch list', })}";

  static m12(orderText) => "Switch to \"${orderText}\" order";

  static m13(order, invert) => "${Intl.select(order, {'asc': '${Intl.select(invert, {'true': 'descending', 'false': 'ascending', })}', 'desc': '${Intl.select(invert, {'true': 'ascending', 'false': 'descending', })}', })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "_DiscoverMoviesScreen__sortText" : m0,
    "_DiscoverMoviesScreen_applyButton" : MessageLookupByLibrary.simpleMessage("Apply"),
    "_DiscoverMoviesScreen_closeButton" : MessageLookupByLibrary.simpleMessage("Close"),
    "_DiscoverMoviesScreen_ofRelease" : MessageLookupByLibrary.simpleMessage("of release"),
    "_DiscoverMoviesScreen_orderText" : m1,
    "_DiscoverMoviesScreen_pageTitle" : MessageLookupByLibrary.simpleMessage("Discover Movies"),
    "_DiscoverMoviesScreen_setupButton" : MessageLookupByLibrary.simpleMessage("Setup Filters"),
    "_DiscoverMoviesScreen_setupTitle" : MessageLookupByLibrary.simpleMessage("Discover Movies Setup"),
    "_DiscoverMoviesScreen_year" : MessageLookupByLibrary.simpleMessage("Year"),
    "_DiscoverMoviesScreen_yearOfReleaseError" : MessageLookupByLibrary.simpleMessage("Invalid year"),
    "_DiscoverMoviesScreen_yearOfReleaseHint" : MessageLookupByLibrary.simpleMessage("Sample: 2004"),
    "_General_appDrawerLeadingButtonTooltip" : MessageLookupByLibrary.simpleMessage("Open navigation menu"),
    "_General_cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "_General_clear" : MessageLookupByLibrary.simpleMessage("Clear"),
    "_General_loading" : MessageLookupByLibrary.simpleMessage("Loading"),
    "_General_no" : m2,
    "_General_welcome" : MessageLookupByLibrary.simpleMessage("Welcome"),
    "_General_yes" : m3,
    "_General_yesNo" : m4,
    "_LibraryScreen_createdAt" : MessageLookupByLibrary.simpleMessage("Created at"),
    "_LibraryScreen_favoriteMovies" : MessageLookupByLibrary.simpleMessage("Favorite Movies"),
    "_LibraryScreen_favoriteTvs" : MessageLookupByLibrary.simpleMessage("Favorite Tvs"),
    "_LibraryScreen_myLists" : MessageLookupByLibrary.simpleMessage("My Lists"),
    "_LibraryScreen_updatedAt" : MessageLookupByLibrary.simpleMessage("Updated at"),
    "_LibraryScreen_watchListMovies" : MessageLookupByLibrary.simpleMessage("Movies to Watch"),
    "_LibraryScreen_watchListTvs" : MessageLookupByLibrary.simpleMessage("Tvs to Watch"),
    "_MediaButtons_favorite" : MessageLookupByLibrary.simpleMessage("Favorite"),
    "_MediaButtons_favoriteTooltip" : m5,
    "_MediaButtons_playlist" : MessageLookupByLibrary.simpleMessage("Add to playlist"),
    "_MediaButtons_playlistTooltip" : MessageLookupByLibrary.simpleMessage("Add to playlist"),
    "_MediaButtons_rate" : MessageLookupByLibrary.simpleMessage("Rate"),
    "_MediaButtons_rateTooltip" : m6,
    "_MediaButtons_watchList" : MessageLookupByLibrary.simpleMessage("Watch List"),
    "_MediaButtons_watchListTooltip" : m7,
    "_MovieDetailsScreen_btnRecommendations" : MessageLookupByLibrary.simpleMessage("Show recommendations based on this title"),
    "_MovieDetailsScreen_budget" : MessageLookupByLibrary.simpleMessage("Budget"),
    "_MovieDetailsScreen_cast" : MessageLookupByLibrary.simpleMessage("Cast"),
    "_MovieDetailsScreen_crew" : MessageLookupByLibrary.simpleMessage("Crew"),
    "_MovieDetailsScreen_genres" : MessageLookupByLibrary.simpleMessage("Genres"),
    "_MovieDetailsScreen_revenue" : MessageLookupByLibrary.simpleMessage("Revenue"),
    "_MovieDetailsScreen_status" : MessageLookupByLibrary.simpleMessage("Status"),
    "_PersonDetailsScreen_biography" : MessageLookupByLibrary.simpleMessage("Biography"),
    "_PersonDetailsScreen_knownFor" : MessageLookupByLibrary.simpleMessage("Known for"),
    "_PersonDetailsScreen_notAvailable" : MessageLookupByLibrary.simpleMessage("Not available"),
    "_PersonDetailsScreen_placeOfBirth" : MessageLookupByLibrary.simpleMessage("Place of birth"),
    "_ScreensTitles_about" : MessageLookupByLibrary.simpleMessage("About"),
    "_ScreensTitles_discover" : MessageLookupByLibrary.simpleMessage("Discover"),
    "_ScreensTitles_library" : MessageLookupByLibrary.simpleMessage("Library"),
    "_ScreensTitles_recommendations" : MessageLookupByLibrary.simpleMessage("Recommendations"),
    "_ScreensTitles_settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "_ScreensTitles_settingsLanguages" : MessageLookupByLibrary.simpleMessage("Select a Language"),
    "_ScreensTitles_settingsRegions" : MessageLookupByLibrary.simpleMessage("Select a Region"),
    "_ScreensTitles_trending" : MessageLookupByLibrary.simpleMessage("Trending"),
    "_SearchScreen_btnClear" : MessageLookupByLibrary.simpleMessage("Clear"),
    "_SearchScreen_noResults" : MessageLookupByLibrary.simpleMessage("No results found"),
    "_SearchScreen_searching" : MessageLookupByLibrary.simpleMessage("Searching"),
    "_SearchScreen_title" : MessageLookupByLibrary.simpleMessage("Search"),
    "_SearchScreen_unknownMediaType" : MessageLookupByLibrary.simpleMessage("Unknown media type"),
    "_SettingsScreen_grid" : MessageLookupByLibrary.simpleMessage("Grid"),
    "_SettingsScreen_imageHighQuality" : MessageLookupByLibrary.simpleMessage("Image high quality"),
    "_SettingsScreen_includeAdult" : MessageLookupByLibrary.simpleMessage("Include adult"),
    "_SettingsScreen_language" : MessageLookupByLibrary.simpleMessage("Language"),
    "_SettingsScreen_list" : MessageLookupByLibrary.simpleMessage("List"),
    "_SettingsScreen_region" : MessageLookupByLibrary.simpleMessage("Region"),
    "_SettingsScreen_viewMode" : MessageLookupByLibrary.simpleMessage("View mode"),
    "_SnackBarMessages__listsChanged" : m8,
    "_SnackBarMessages_favoriteChanged" : m9,
    "_SnackBarMessages_rateChanged" : m10,
    "_SnackBarMessages_watchListChanged" : m11,
    "_TmdbObjects__sortOrderSwitch" : m12,
    "_TmdbObjects_sortOrder" : m13,
    "_TvDetailsScreen_btnRecommendations" : MessageLookupByLibrary.simpleMessage("Show recommendations based on this title"),
    "_TvDetailsScreen_cast" : MessageLookupByLibrary.simpleMessage("Cast"),
    "_TvDetailsScreen_createdBy" : MessageLookupByLibrary.simpleMessage("Created By"),
    "_TvDetailsScreen_crew" : MessageLookupByLibrary.simpleMessage("Crew"),
    "_TvDetailsScreen_episodes" : MessageLookupByLibrary.simpleMessage("Episodes"),
    "_TvDetailsScreen_inProduction" : MessageLookupByLibrary.simpleMessage("In Production"),
    "_TvDetailsScreen_seasons" : MessageLookupByLibrary.simpleMessage("Seasons"),
    "_TvDetailsScreen_status" : MessageLookupByLibrary.simpleMessage("Status"),
    "_TvEpisodeDetailsScreen_episode" : MessageLookupByLibrary.simpleMessage("Episode"),
    "_TvEpisodeDetailsScreen_guestStars" : MessageLookupByLibrary.simpleMessage("Guest Stars"),
    "_TvEpisodeDetailsScreen_season" : MessageLookupByLibrary.simpleMessage("Season"),
    "_TvSeasonDetailsScreen_episodes" : MessageLookupByLibrary.simpleMessage("episodes"),
    "_TvSeasonDetailsScreen_season" : MessageLookupByLibrary.simpleMessage("Season"),
    "appTitle" : MessageLookupByLibrary.simpleMessage("Cinerama")
  };
}
