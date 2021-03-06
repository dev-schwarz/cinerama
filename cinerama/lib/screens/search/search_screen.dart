import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../material.dart';
import '../../stores/search_store.dart';
import 'search_multi_delegate.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchStore _searchStore = SearchStore();
  String _lastQuery;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).whenComplete(() {
      _openSearchDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Column(
          children: [
            Text(context.i18n.screens.search.title),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _openSearchDialog();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                if (!_searchStore.hasResults) {
                  return BigIconMessage(
                    iconData: Icons.search,
                    message: context.i18n.screens.search.title,
                  );
                } else {
                  if (_searchStore.searchMulti.totalResults == 0) {
                    return BigIconMessage(
                      iconData: Icons.sentiment_dissatisfied,
                      message: context.i18n.screens.search.noResults,
                    );
                  } else {
                    return Observer(
                      builder: (_) {
                        return ResultsView<SearchMulti>(
                          content: _searchStore.searchMulti,
                          loadNextPage: _searchStore.fetchSearchMultiNextPage,
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openSearchDialog() async {
    final query = await showSearch(
      context: context,
      delegate: SearchMultiDelegate(SearchSuggestionsStore()),
      query: _lastQuery,
    );

    if (query != null) {
      _lastQuery = query;
      _searchStore.queryChanged(query);
    } else if (_lastQuery == null) {
      Modular.to.pop();
    }
  }
}
