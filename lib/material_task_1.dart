// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TabItem {
  String title;
  Icon icon;
  TabItem({required this.title, required this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: 'Home', icon: Icon(Icons.home)),
  TabItem(title: 'Chat', icon: Icon(Icons.chat)),
  TabItem(title: 'Albums', icon: Icon(Icons.album)),
];

class MaterialTaskOne extends StatefulWidget {
  const MaterialTaskOne({Key? key}) : super(key: key);

  @override
  State<MaterialTaskOne> createState() => _MaterialTaskOneState();
}

class _MaterialTaskOneState extends State<MaterialTaskOne>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;
  final String link =
      'https://i.pinimg.com/originals/59/6e/e0/596ee074fd5d7357fff827d09e09f0c2.jpg';
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: [
          Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ))
        ],
        backgroundColor: Colors.deepPurple,
        title: Text('Flutter Demo Hope Page'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: TextLabel(text: "Home"),
          ),
          Container(
            child: TextLabel(text: "Chat"),
          ),
          Container(
            child: TextLabel(text: "Albums"),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex - index;
          });
        },
        currentIndex: _currentTabIndex,
        items: [
          for (var item in _tabBar)
            BottomNavigationBarItem(label: item.title, icon: item.icon)
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(link),
            )),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.account_box_outlined),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              title: Text('Images'),
              leading: Icon(Icons.image),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Log out'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[350],
                      onPrimary: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(76, 0, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Registration'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[350],
                        onPrimary: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(link),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Text('UserProfile')],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () => setState(() {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                    padding: EdgeInsets.all(20),
                    height: 200,
                    color: Colors.white70,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.payment,
                                  color: Colors.grey,
                                )
                              ],
                            )),
                            Expanded(
                              flex: 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Amount:',
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '200 RUB',
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 16),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Pay'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[350],
                                onPrimary: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ));
              });
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}

class TextLabel extends StatelessWidget {
  const TextLabel({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
