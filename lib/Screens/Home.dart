import 'package:flutter/material.dart';
import 'package:versyll/Screens/Search.dart';
import 'package:versyll/Screens/library.dart';
import 'package:versyll/Screens/homeBody.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = [
    HomeBody(),
    SearchPage(),
    LibraryPage(),
  ];
  int selectedIndex = 0;
  void ItemTapped(int index) {
    setState(
      () {
        selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<AppBar> appBars = [
      AppBar(
        title: Text("Welcome Back!"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                IconButton(
                  icon: CustIcon(
                    iconParam: Icon(Icons.person),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/user');
                  },
                ),
                IconButton(
                  icon: CustIcon(
                    iconParam: Icon(Icons.add),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addsong');
                  },
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      AppBar(
          title: Text("Search"), backgroundColor: Colors.black, elevation: 0),
      AppBar(
          title: Text('My Song'),
          leading: IconButton(
            onPressed: () {},
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/user');
              },
              icon: CustIcon(
                iconParam: Icon(Icons.person),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: CustIcon(
                iconParam: Icon(Icons.search),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: CustIcon(
                iconParam: Icon(Icons.add),
              ),
            ),
          ],
          backgroundColor: Colors.black,
          elevation: 0),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBars[selectedIndex],
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: ItemTapped,
            backgroundColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_music), label: 'Library'),
            ]),
      ),
    );
  }
}
