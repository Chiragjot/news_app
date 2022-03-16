import 'package:flutter/material.dart';
import './screens/news_screen.dart';
import 'package:fluttericon/linecons_icons.dart';

class NewsTabs extends StatefulWidget {
  @override
  State<NewsTabs> createState() => _NewsTabsState();
}

class _NewsTabsState extends State<NewsTabs> {

  int pageIndex = 0;
  _setIndex(int index){
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(242, 238, 203, 1),
        title: Center(
            child: Column(
          children: [
            Text(
              "News Digest",
              style: TextStyle(
                wordSpacing: 10,
                letterSpacing: 5,
                fontSize: 50,
                color: Colors.black,
                fontFamily: 'News',
              ),
            ),
          ],
        )),
      ),
      body: NewsScreen(pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setIndex,
        backgroundColor: Color.fromRGBO(242, 238, 203, 1),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.pink,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(242, 238, 203, 1),
            icon: Icon(Linecons.globe),
            label: 'Global'
          ) ,
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(242, 238, 203, 1),
            icon: Icon(Icons.sports_soccer),
            label: 'Sports'
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(242, 238, 203, 1),
            icon: Icon(Icons.flag),
            label: 'local'
          )
        ],
      ),
    );
  }
}
