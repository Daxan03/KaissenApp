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

  final Home _home = Home();
  final Citas _citas = Citas();
  final Login _login = Login();

  // ignore: unused_field
  Widget _showpage = new Home();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _home;
      case 1:
        return _citas;
      case 2:
        return _login;
      default:
        return Container(
          child: new Center(
            child: new Text('pagina no encontrada'),
          ),
        );
    }
  }

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 60.0,
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
              _showpage = _pageChooser(tappedIndex);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
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
                      "Este es el contenido de la tarjeta",
                    ),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ));
  }
}
