import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.account_box)],
        title: Text(
          "L3GL",
        ),
      ),
      body: Center(
        child: FlutterLogo(),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("MOUHAMED DIOP"),
            ),
            ListTile(
              title: Text("Paramètre"),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Paramètre"),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Paramètre"),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Paramètre"),
              leading: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("pressed"),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz), label: "Options"),
        ],
      ),
    );
  }
}
