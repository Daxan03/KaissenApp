import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:logginprop/pages/citas.dart';
import 'package:logginprop/pages/home.dart';
import 'package:logginprop/pages/login.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

//create all the pages
  final PageHome _home = PageHome();
  final PageCitas _citas = PageCitas();
  final PageLogin _login = PageLogin();

  Widget _showPage = new PageHome();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _home;
        break;
      case 1:
        return _citas;
        break;
      case 2:
        return _login;
        break;
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

  //GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          //key: _bottomNavigationKey,
          index: pageIndex,
          //height: 60.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.calendar_today, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
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

            /*child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 400,
                    height: 200,
                    child: Text(
                      "Realmente es un cambio?",
                    ),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),*/
          ),
        ));
  }
}