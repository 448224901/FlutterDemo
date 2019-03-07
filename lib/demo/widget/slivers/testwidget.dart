import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: 'Test', home: TestApp()));

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  void handleTabChange() {
    print('Outer tab index: ${_tabController.index}');
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build main');
    return Scaffold(
        appBar: AppBar(
          title: Text('Test'),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[Tab(text: 'One'), Tab(text: 'Two')],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ListView.builder(
                key: PageStorageKey('one'),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('One $index'),
                  );
                }),
            TestTab()
          ],
        ));
  }
}

class TestTab extends StatefulWidget {
  @override
  _TestTabState createState() => _TestTabState();
}

class _TestTabState extends State<TestTab> with SingleTickerProviderStateMixin {
  final _tabKey = ValueKey('tab');

  TabController _innerTabController;

  void handleTabChange() {
    print(
        'Inner tab, previous: ${_innerTabController.previousIndex}, current: ${_innerTabController.index}');
    PageStorage.of(context)
        .writeState(context, _innerTabController.index, identifier: _tabKey);
  }

  @override
  void initState() {
    super.initState();
    print('init');
    int initialIndex =
        PageStorage.of(context).readState(context, identifier: _tabKey);
    _innerTabController = TabController(
        length: 2,
        vsync: this,
        initialIndex: initialIndex != null ? initialIndex : 0);
    _innerTabController.addListener(handleTabChange);
  }

  @override
  void dispose() {
    _innerTabController.removeListener(handleTabChange);
    _innerTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _innerTabController,
          tabs: <Widget>[
            Tab(
              child: Text('1'),
            ),
            Tab(
              child: Text('2'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _innerTabController,
        children: <Widget>[
          ListView.builder(
              key: PageStorageKey('1'),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('child1 $index'));
              }),
          ListView.builder(
              key: PageStorageKey('2'),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('child2 $index'));
              })
        ],
      ),
    );
  }
}
