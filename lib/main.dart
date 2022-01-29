import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/home_screen.dart';
import 'package:flutter_blog/screens/list_screen.dart';
import 'package:flutter_blog/screens/profile_screen.dart';

void main() {
  runApp(const MyBlog());
}

class MyBlog extends StatefulWidget {
  const MyBlog({Key? key}) : super(key: key);

  @override
  State<MyBlog> createState() => _MyBlogState();
}

class _MyBlogState extends State<MyBlog> {
  int _index = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    ListScreen(),
    ProfileScreen(),
  ];

  void _changePage(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Blog'),
        ),
        body: Container(child: _screens.elementAt(_index)),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'LIST',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'PROFILE',
            ),
          ],
          currentIndex: _index,
          onTap: _changePage,
        ),
      ),
    );
  }
}
