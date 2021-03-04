import 'package:flutter_mobx/flutter_mobx.dart';

import '../../material.dart';
import '../../stores/results/discover_movies_store.dart';
import 'discover_movies_contents.dart';
import 'widgets/discover_movies_setup.dart';

class DiscoverMoviesScreen extends StatefulWidget {
  const DiscoverMoviesScreen({Key key}) : super(key: key);

  @override
  _DiscoverMoviesScreenState createState() => _DiscoverMoviesScreenState();
}

class _DiscoverMoviesScreenState extends State<DiscoverMoviesScreen>
    with SingleTickerProviderStateMixin<DiscoverMoviesScreen> {
  AnimationController _controller;
  Animation<double> _animation;
  DiscoverMoviesStore _store;

  DiscoverMoviesViewStore get _viewStore => _store.viewStore;
  DiscoverMoviesFilterStore get _filterStore => _store.filterStore;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        _viewStore.setAnimationValue(_animation.value);
      });

    _store = DiscoverMoviesStore(initialAnimationValue: _animation.value);
    _store.setupReactions();

    if (!_store.hasResults) {
      _store.fetchResults();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleOnWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: _appBarLeadingButton(),
          title: _appBarTitle(),
          actions: _appBarActions(),
        ),
        drawer: const AppDrawer(),
        body: Stack(
          children: [
            Observer(
              builder: (_) {
                return AbsorbPointer(
                  absorbing: _viewStore.setupMode,
                  child: DiscoverMoviesContents(_store),
                );
              },
            ),
            Observer(
              builder: (_) {
                return IgnorePointer(
                  ignoring: !_viewStore.setupMode,
                  child: Opacity(
                    opacity: _viewStore.opacity,
                    child: DiscoverMoviesSetup(
                      _store,
                      opacity: _viewStore.setupDialogOpacity,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _appBarActions() {
    return [
      Observer(
        builder: (_) {
          return Opacity(
            opacity: _viewStore.actionIconOpacity,
            child: IconButton(
              icon: Icon(_viewStore.actionIconData),
              tooltip: _viewStore.setupMode
                  ? context.i18n.screens.discoverMoviesScreen.applyButton
                  : context.i18n.screens.discoverMoviesScreen.setupButton,
              color: context.theme.iconTheme.color,
              onPressed: _viewStore.isAnimating
                  ? null
                  : (!_viewStore.setupMode
                      ? _showSetupDialog
                      : (_filterStore.formValid ? _onApplySetupFilter : null)),
            ),
          );
        },
      ),
      Observer(
        builder: (_) {
          return !_viewStore.setupMode ? const AppBarSearchButton() : Container();
        },
      ),
    ];
  }

  Widget _appBarTitle() {
    return Observer(
      builder: (_) {
        return Opacity(
          opacity: _viewStore.actionIconOpacity,
          child: Text(
            _viewStore.setupMode
                ? context.i18n.screens.discoverMoviesScreen.setupTitle
                : context.i18n.screens.discoverMoviesScreen.pageTitle,
          ),
        );
      },
    );
  }

  Widget _appBarLeadingButton() {
    return Observer(
      builder: (_) {
        if (_viewStore.setupMode) {
          return Opacity(
            opacity: _viewStore.closeButtonOpacity,
            child: IconButton(
              icon: const Icon(Icons.close),
              disabledColor: context.theme.iconTheme.color,
              tooltip: context.i18n.screens.discoverMoviesScreen.closeButton,
              onPressed: _viewStore.isAnimating ? null : () => _hideSetupDialog(resetFilter: true),
            ),
          );
        } else {
          return const AppDrawerLeadingButton();
        }
      },
    );
  }

  Future<bool> _handleOnWillPop() {
    if (_viewStore.setupMode) {
      _hideSetupDialog(resetFilter: true);
      return Future<bool>.value(false);
    }
    return Future<bool>.value(true);
  }

  void _onApplySetupFilter() {
    _store.applySetupFilter();
    _hideSetupDialog();
  }

  void _showSetupDialog() {
    _controller.forward();
  }

  void _hideSetupDialog({bool resetFilter = false}) {
    FocusScope.of(context).unfocus();
    if (resetFilter) {
      _store.resetFilterStore();
    }
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(() {})
      ..dispose();
    _store.dispose();

    super.dispose();
  }
}
