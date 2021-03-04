import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../material.dart';
import '../../stores/controllers/home_screen_controller.dart';
import '../../stores/results/trending_store.dart';
import '../discover/discover_movies_screen.dart';
import '../library/library_screen.dart';
import '../trending/trending_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeScreenController> {
  List<_BottomNavBarItemData> _pages;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _pages = [
      _BottomNavBarItemData(
        icon: Icons.trending_up,
        label: context.i18n.screens.titles.trending,
        child: TrendingScreen(TrendingStore()),
      ),
      _BottomNavBarItemData(
        icon: Icons.new_releases,
        label: context.i18n.screens.titles.discover,
        child: const DiscoverMoviesScreen(),
      ),
      _BottomNavBarItemData(
        icon: Icons.assignment,
        label: context.i18n.screens.titles.assignments,
        child: _TempScreen(context.i18n.screens.titles.assignments),
      ),
      _BottomNavBarItemData(
        icon: Icons.video_library,
        label: context.i18n.screens.titles.library,
        child: const LibraryScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          primary: false,
          body: _body,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            backgroundColor: context.theme.canvasColor,
            unselectedItemColor: context.theme.unselectedWidgetColor,
            selectedItemColor: context.theme.accentColor,
            currentIndex: this.controller.pageIndex,
            onTap: this.controller.changePage,
            items: _bottomNavigationBarItems,
          ),
        );
      },
    );
  }

  Widget get _body {
    return _pages[this.controller.pageIndex].child;
  }

  List<BottomNavigationBarItem> get _bottomNavigationBarItems {
    return _pages
        .map<BottomNavigationBarItem>((data) => BottomNavigationBarItem(
              icon: Icon(data.icon),
              label: data.label,
            ))
        .toList();
  }
}

class _BottomNavBarItemData {
  const _BottomNavBarItemData({
    @required this.icon,
    @required this.label,
    @required this.child,
  });

  final IconData icon;
  final String label;
  final Widget child;
}

class _TempScreen extends StatelessWidget {
  const _TempScreen(this.title, {Key key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppDrawerLeadingButton(),
        title: Text(title),
        actions: const [
          const AppBarSearchButton(),
        ],
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          title,
          style: context.theme.textTheme.headline6,
        ),
      ),
    );
  }
}
