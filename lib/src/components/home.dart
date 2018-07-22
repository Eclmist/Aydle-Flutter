import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );
    // Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aydle'),
        bottom: TabBar(
          tabs: <Widget>[
            MaterialButton(
              child: Text('Join Lobby'),
            ),
            MaterialButton(
              child: Text('Host Lobby'),
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: buildDrawer(context),
      body: DecoratedBox(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            buildJoin(),
            buildHost(),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background/night/blur.png'),
          ),
        ),
      ),
    );
  }

  Widget buildJoin() {
    return Container(
      child: Text('Join'),
    );
  }

  Widget buildHost() {
    return Container(
      child: Text('Host'),
    );
  }

  Widget buildDrawer(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Guest'),
            accountEmail: Text('guest@aydlesoft.com'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            onTap: () {},
          ),
          ListTile(
            title: Text('Replay'),
            leading: Icon(Icons.history),
            onTap: () {},
          ),
          ListTile(
            title: Text('Friends'),
            leading: Icon(Icons.people),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onTap: () {},
          ),
          ListTile(
            title: Text('Help & feedback'),
            leading: Icon(Icons.help),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              _logout();
            },
          ),
          Divider(),
          ListTile(
            title: Text('Aydle Version 0.0.2'),
            subtitle: Text('© Aydlesoft 2018'),
          )
        ],
      ),
    );
  }

  Future<Null> _logout() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('LOGOUT'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        );
      },
    );
  }
}
