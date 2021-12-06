import 'package:flutter/material.dart';

import 'package:logginprop/pages/login.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PageLogin()));

/*class BottomNavBar extends StatefulWidget {
  @override

  
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

//creacion de las paginas
  final PageHome _home = PageHome();
  final PageCitas _citas = PageCitas();
  final PageLogin _login = PageLogin();

  Widget _showPage = new PageHome();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _home;
      //  break;
      case 1:
        return _citas;
      //  break;
      case 2:
        return _login;
      //  break;
      default:
        return new Container(
          child: new Center(
            child: new Text(
              'No se encontró la pagina por el chooser',
              textScaleFactor: 2.0,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: pageIndex,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.calendar_today, size: 30, color: Colors.white),
            Icon(Icons.perm_identity, size: 30, color: Colors.white),
          ],
          color: Colors.blueAccent,
          buttonBackgroundColor: Colors.blueAccent,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}*/
