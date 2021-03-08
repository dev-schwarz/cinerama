// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static m0(sortText) => "${Intl.select(sortText, {'popularity': 'Popularidade', 'original_title': 'Título', 'release_date': 'Lançamento', 'vote_average': 'Avaliação', 'vote_count': 'Mais votados', 'revenue': 'Renda', })}";

  static m1(order) => "${Intl.select(order, {'asc': 'Ordem ascending', 'desc': 'Ordem descendente', })}";

  static m2(firstLetterUCase) => "${Intl.select(firstLetterUCase, {'true': 'Não', 'false': 'não', })}";

  static m3(firstLetterUCase) => "${Intl.select(firstLetterUCase, {'true': 'Sim', 'false': 'sim', })}";

  static m4(yes) => "${Intl.select(yes, {'true': 'sim', 'false': 'não', })}";

  static m5(value) => "${Intl.select(value, {'true': 'Remover dos favoritos', 'false': 'Adicionar aos favoritos', })}";

  static m6(value) => "${Intl.select(value, {'true': 'Editar ou remover sua avaliação', 'false': 'Avaliar', })}";

  static m7(value) => "${Intl.select(value, {'true': 'Remover da lista', 'false': 'Adicionar a lista', })}";

  static m8(added, howMany) => "${Intl.select(added, {'true': '${Intl.plural(howMany, zero: '', one: 'Adicionado a 1 lista. ', other: 'Adicionado a ${howMany} listas. ')}', 'false': '${Intl.plural(howMany, zero: '', one: 'Removido de 1 lista. ', other: 'Removido de ${howMany} listas. ')}', })}";

  static m9(value) => "${Intl.select(value, {'true': 'Adicionado aos favoritos', 'false': 'Removido dos favoritos', })}";

  static m10(value) => "${Intl.select(value, {'true': 'Item avaliado', 'false': 'Avaliação do item removida', })}";

  static m11(value) => "${Intl.select(value, {'true': 'Adicionado em assistir depois', 'false': 'Removido de assistir depois', })}";

  static m12(orderText) => "Mudar para ordem \"${orderText}\"";

  static m13(order, invert) => "${Intl.select(order, {'asc': '${Intl.select(invert, {'true': 'descendente', 'false': 'ascendente', })}', 'desc': '${Intl.select(invert, {'true': 'ascendente', 'false': 'descendente', })}', })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "_DiscoverMoviesScreen__sortText" : m0,
    "_DiscoverMoviesScreen_applyButton" : MessageLookupByLibrary.simpleMessage("Aplicar"),
    "_DiscoverMoviesScreen_closeButton" : MessageLookupByLibrary.simpleMessage("Fechar"),
    "_DiscoverMoviesScreen_ofRelease" : MessageLookupByLibrary.simpleMessage("de lançamento"),
    "_DiscoverMoviesScreen_orderText" : m1,
    "_DiscoverMoviesScreen_pageTitle" : MessageLookupByLibrary.simpleMessage("Descobrir Filmes"),
    "_DiscoverMoviesScreen_setupButton" : MessageLookupByLibrary.simpleMessage("Configurar Filtros"),
    "_DiscoverMoviesScreen_setupTitle" : MessageLookupByLibrary.simpleMessage("Descobrir Filmes - Filtros"),
    "_DiscoverMoviesScreen_year" : MessageLookupByLibrary.simpleMessage("Ano"),
    "_DiscoverMoviesScreen_yearOfReleaseError" : MessageLookupByLibrary.simpleMessage("Ano inválido"),
    "_DiscoverMoviesScreen_yearOfReleaseHint" : MessageLookupByLibrary.simpleMessage("Exemplo: 2004"),
    "_General_appDrawerLeadingButtonTooltip" : MessageLookupByLibrary.simpleMessage("Exibir menu"),
    "_General_cancel" : MessageLookupByLibrary.simpleMessage("Cancelar"),
    "_General_clear" : MessageLookupByLibrary.simpleMessage("Limpar"),
    "_General_loading" : MessageLookupByLibrary.simpleMessage("Carregando"),
    "_General_no" : m2,
    "_General_welcome" : MessageLookupByLibrary.simpleMessage("Bem-vindo"),
    "_General_yes" : m3,
    "_General_yesNo" : m4,
    "_LibraryScreen_createdAt" : MessageLookupByLibrary.simpleMessage("Criada em"),
    "_LibraryScreen_favoriteMovies" : MessageLookupByLibrary.simpleMessage("Filmes Favoritos"),
    "_LibraryScreen_favoriteTvs" : MessageLookupByLibrary.simpleMessage("Tvs Favoritos"),
    "_LibraryScreen_myLists" : MessageLookupByLibrary.simpleMessage("Minhas Listas"),
    "_LibraryScreen_updatedAt" : MessageLookupByLibrary.simpleMessage("Atualizada em"),
    "_LibraryScreen_watchListMovies" : MessageLookupByLibrary.simpleMessage("Filmes para Assistir"),
    "_LibraryScreen_watchListTvs" : MessageLookupByLibrary.simpleMessage("Tvs para Assistir"),
    "_MediaButtons_favorite" : MessageLookupByLibrary.simpleMessage("Favorito"),
    "_MediaButtons_favoriteTooltip" : m5,
    "_MediaButtons_playlist" : MessageLookupByLibrary.simpleMessage("Minhas listas"),
    "_MediaButtons_playlistTooltip" : MessageLookupByLibrary.simpleMessage("Adicionar ou remover das minhas listas"),
    "_MediaButtons_rate" : MessageLookupByLibrary.simpleMessage("Avaliar"),
    "_MediaButtons_rateTooltip" : m6,
    "_MediaButtons_watchList" : MessageLookupByLibrary.simpleMessage("Assistir depois"),
    "_MediaButtons_watchListTooltip" : m7,
    "_MovieDetailsScreen_btnRecommendations" : MessageLookupByLibrary.simpleMessage("Mostrar recomendações baseado neste título"),
    "_MovieDetailsScreen_budget" : MessageLookupByLibrary.simpleMessage("Orçamento"),
    "_MovieDetailsScreen_cast" : MessageLookupByLibrary.simpleMessage("Elenco"),
    "_MovieDetailsScreen_crew" : MessageLookupByLibrary.simpleMessage("Equipe"),
    "_MovieDetailsScreen_genres" : MessageLookupByLibrary.simpleMessage("Gêneros"),
    "_MovieDetailsScreen_revenue" : MessageLookupByLibrary.simpleMessage("Renda"),
    "_MovieDetailsScreen_status" : MessageLookupByLibrary.simpleMessage("Status"),
    "_PersonDetailsScreen_biography" : MessageLookupByLibrary.simpleMessage("Biografia"),
    "_PersonDetailsScreen_knownFor" : MessageLookupByLibrary.simpleMessage("Conhecido por"),
    "_PersonDetailsScreen_notAvailable" : MessageLookupByLibrary.simpleMessage("Não disponível"),
    "_PersonDetailsScreen_placeOfBirth" : MessageLookupByLibrary.simpleMessage("Local de nascimento"),
    "_ScreensTitles_about" : MessageLookupByLibrary.simpleMessage("Sobre"),
    "_ScreensTitles_assignments" : MessageLookupByLibrary.simpleMessage("Inscrições"),
    "_ScreensTitles_discover" : MessageLookupByLibrary.simpleMessage("Descubra"),
    "_ScreensTitles_library" : MessageLookupByLibrary.simpleMessage("Biblioteca"),
    "_ScreensTitles_settings" : MessageLookupByLibrary.simpleMessage("Configurações"),
    "_ScreensTitles_settingsLanguages" : MessageLookupByLibrary.simpleMessage("Selecione um idioma"),
    "_ScreensTitles_settingsRegions" : MessageLookupByLibrary.simpleMessage("Selecione uma região"),
    "_ScreensTitles_trending" : MessageLookupByLibrary.simpleMessage("Em Destaque"),
    "_SearchScreen_btnClear" : MessageLookupByLibrary.simpleMessage("Limpar"),
    "_SearchScreen_noResults" : MessageLookupByLibrary.simpleMessage("Nenhum resultado encontrado"),
    "_SearchScreen_searching" : MessageLookupByLibrary.simpleMessage("Pesquisando"),
    "_SearchScreen_title" : MessageLookupByLibrary.simpleMessage("Pesquisar"),
    "_SearchScreen_unknownMediaType" : MessageLookupByLibrary.simpleMessage("Tipo de mídia desconhecido"),
    "_SettingsScreen_grid" : MessageLookupByLibrary.simpleMessage("Grade"),
    "_SettingsScreen_imageHighQuality" : MessageLookupByLibrary.simpleMessage("Imagem de alta qualidade"),
    "_SettingsScreen_includeAdult" : MessageLookupByLibrary.simpleMessage("Incluir adulto"),
    "_SettingsScreen_language" : MessageLookupByLibrary.simpleMessage("Idioma"),
    "_SettingsScreen_list" : MessageLookupByLibrary.simpleMessage("Lista"),
    "_SettingsScreen_region" : MessageLookupByLibrary.simpleMessage("Região"),
    "_SettingsScreen_viewMode" : MessageLookupByLibrary.simpleMessage("Modo de exibição"),
    "_SnackBarMessages__listsChanged" : m8,
    "_SnackBarMessages_favoriteChanged" : m9,
    "_SnackBarMessages_rateChanged" : m10,
    "_SnackBarMessages_watchListChanged" : m11,
    "_TmdbObjects__sortOrderSwitch" : m12,
    "_TmdbObjects_sortOrder" : m13,
    "_TvDetailsScreen_btnRecommendations" : MessageLookupByLibrary.simpleMessage("Mostrar recomendações baseado neste título"),
    "_TvDetailsScreen_cast" : MessageLookupByLibrary.simpleMessage("Elenco"),
    "_TvDetailsScreen_createdBy" : MessageLookupByLibrary.simpleMessage("Criado Por"),
    "_TvDetailsScreen_crew" : MessageLookupByLibrary.simpleMessage("Equipe"),
    "_TvDetailsScreen_episodes" : MessageLookupByLibrary.simpleMessage("Episódios"),
    "_TvDetailsScreen_inProduction" : MessageLookupByLibrary.simpleMessage("Em Produção"),
    "_TvDetailsScreen_seasons" : MessageLookupByLibrary.simpleMessage("Temporadas"),
    "_TvDetailsScreen_status" : MessageLookupByLibrary.simpleMessage("Status"),
    "appTitle" : MessageLookupByLibrary.simpleMessage("Cinerama")
  };
}
