import '../../material.dart';
import 'recommendations_movies_contents.dart';
import 'recommendations_tvs_contents.dart';

class RecommendationsScreen extends StatefulWidget {
  const RecommendationsScreen({Key key}) : super(key: key);

  @override
  _RecommendationsScreenState createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen>
    with SingleTickerProviderStateMixin<RecommendationsScreen> {
  TabController _tabController;
  List<Tab> _tabs;

  int _tabIndex;
  String _pageTitle;

  void _updatePageTitle() {
    _pageTitle = _tabs[_tabIndex].text.toLowerCase();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _tabs = const [
      Tab(text: 'MOVIES'),
      Tab(text: 'TVS'),
    ];

    _tabIndex = 0;
    _updatePageTitle();

    _tabController = TabController(
      vsync: this,
      length: _tabs.length,
      initialIndex: _tabIndex,
    )..addListener(() {
        if (!_tabController.indexIsChanging) {
          setState(() {
            _tabIndex = _tabController.index;
            _updatePageTitle();
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppDrawerLeadingButton(),
        // TODO: Add localizations here!
        title: Text('Recommended $_pageTitle'),
        actions: const [
          AppBarSearchButton(),
        ],
        // bottomOpacity: 0.4,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: _tabs,
        ),
      ),
      drawer: const AppDrawer(),
      body: TabBarView(
        controller: _tabController,
        // physics: const NeverScrollableScrollPhysics(),
        children: const [
          RecommendationsMoviesContents(),
          RecommendationsTvsContents(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
